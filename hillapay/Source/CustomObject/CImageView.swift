//
//  CImageView.swift
//  SnappFood
//
//  Created by Salar Zarandi on 10/14/18.
//  Copyright © 2018 ZoodFood Mac. All rights reserved.
//

import UIKit

@IBDesignable
class CImageView: UIImageView {
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            //            clipsToBounds = cornerRadius != 0
        }
    }
    
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
