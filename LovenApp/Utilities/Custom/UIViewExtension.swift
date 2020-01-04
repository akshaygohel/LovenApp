//
//  UIViewExtension.swift
//  LovenApp
//
//  Created by Akshay Gohel on 2020-01-03.
//  Copyright © 2020 Akshay Gohel. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addCornerRadius(withValue value: Float = 16.0) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.masksToBounds = true
    }
    
    func addBorder(withColor color: UIColor, thickness width: Float = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(width)
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        //        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //        layer.shouldRasterize = true
        //        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
