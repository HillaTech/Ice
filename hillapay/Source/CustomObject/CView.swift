//
//  CView.swift
//  SnappFood
//
//  Created by Salar Zarandi on 10/14/18.
//  Copyright © 2018 ZoodFood Mac. All rights reserved.
//

import UIKit

@IBDesignable class CView: UIView {
    
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
            layer.borderColor =  borderColor.cgColor
        }
    }
    
    
    @IBInspectable  var shadowColor: UIColor = .clear {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialize()
    }
    
}
