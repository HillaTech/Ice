//
//  CButton.swift
//  SnappFood
//
//  Created by Salar Zarandi on 10/14/18.
//  Copyright © 2018 ZoodFood Mac. All rights reserved.
//

import UIKit



@IBDesignable class CButton: UIButton {
    
    private var _imagePosition:LXMImagePosition = .left
    
    @IBInspectable  var spacing:CGFloat = 0 {
        didSet{
            setupImage()
        }
    }
    
    @IBInspectable  var imagePosition:String = "left" {
        didSet {
            switch imagePosition.uppercased() {
            case "LEFT":
                _imagePosition = .left
            case "RIGHT":
                _imagePosition = .right
            case "TOP":
                _imagePosition = .top
            case "BOTTOM":
                _imagePosition = .bottom
            default:
                _imagePosition = .left
            }
            setupImage()
            
        }
    }
    
    @IBInspectable  var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable  var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            
        }
    }
    
    @IBInspectable  var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    
    @IBInspectable  var shadowColor: UIColor = .clear{
        didSet {
            layer.shadowColor = shadowColor.cgColor
            
        }
    }
    @IBInspectable  var shadowOpacity: Float = 0.0{
        didSet {
            layer.shadowOpacity = shadowOpacity
            
        }
    }
    @IBInspectable  var shadowRadius: CGFloat = 0{
        didSet {
            layer.shadowRadius = shadowRadius
            
        }
    }
    
    @IBInspectable  var shadowOffset: CGPoint = CGPoint.zero{
        didSet {
            layer.shadowOffset = CGSize(width: shadowOffset.x, height: shadowOffset.y)
            
        }
    }
    
    @IBInspectable  var clipBounds: Bool = true {
        didSet{
            clipsToBounds = clipBounds
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImage()
    }
    
    func setupImage()  {
        setImagePosition(position: _imagePosition, spacing: spacing)
    }
    
    
    enum LXMImagePosition:Int {
        case left = 0             //图片在左，文字在右，默认
        case right = 1             //图片在右，文字在左
        case top = 2              //图片在上，文字在下
        case bottom = 3            //图片在下，文字在上
    }
    
    override func tintColorDidChange() {
        tintColor = UIColor.clear
    }
    
    func setImagePosition(position:LXMImagePosition, spacing:CGFloat) {
        if self.currentImage == nil {
            return
        }
        self.setTitle(self.currentTitle, for: .normal)
        self.setImage(self.currentImage, for: .normal)
        
        
        let imageWidth = self.imageView?.image?.size.width ?? 0
        let imageHeight = self.imageView?.image?.size.height ?? 0
        //    #pragma clang diagnostic push
        //    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        let labelWidth: CGFloat = titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font : titleLabel!.font]).width ?? 0
        let labelHeight: CGFloat = titleLabel?.text?.size(withAttributes: [NSAttributedString.Key.font : titleLabel!.font]).height
            ?? 0
        
        
        let imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
        let imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
        let labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
        let labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
        
        let tempWidth = max(labelWidth, imageWidth);
        let changedWidth = labelWidth + imageWidth - tempWidth;
        let tempHeight = max(labelHeight, imageHeight);
        let changedHeight = labelHeight + imageHeight + spacing - tempHeight;
        
        switch (position) {
        case .left:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing/2, bottom: 0, right: spacing/2);
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2);
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: spacing/2);
            break;
            
        case .right:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + spacing/2, bottom: 0, right: -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth + spacing/2), bottom: 0, right: imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: spacing/2);
            break;
            
        case .top:
            self.imageEdgeInsets = UIEdgeInsets(top: -imageOffsetY, left: imageOffsetX, bottom: imageOffsetY, right: -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsets(top: labelOffsetY, left: -labelOffsetX, bottom: -labelOffsetY, right: labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: -changedWidth/2, bottom: changedHeight-imageOffsetY, right: -changedWidth/2);
            break;
            
        case .bottom:
            self.imageEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: imageOffsetX, bottom: -imageOffsetY, right: -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsets(top: -labelOffsetY, left: -labelOffsetX, bottom: labelOffsetY, right: labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsets(top: changedHeight-imageOffsetY, left: -changedWidth/2, bottom: imageOffsetY, right: -changedWidth/2);
            
            break;
            
            
        }
        
    }
    
}
