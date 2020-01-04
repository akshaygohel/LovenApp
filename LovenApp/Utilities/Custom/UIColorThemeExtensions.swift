//
//  UIColorThemeExtensions.swift
//  LovenApp
//
//  Created by Akshay Gohel on 2020-01-03.
//  Copyright © 2020 Akshay Gohel. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class var themeColorNavigationBackground : UIColor {
        get {
            return UIColor.init(red: 131.0/255.0, green: 47.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        }
    }
    
    open class var themeColorBackground : UIColor {
        get {
            return UIColor.init(red: 131.0/255.0, green: 47.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        }
    }
    
    open class var themeColorTextMain : UIColor {
        get {
            return UIColor.white
        }
    }
    
    open class var themeColorTextSubTitle : UIColor {
        get {
            return UIColor.white
        }
    }
    
    open class var themeColorLink : UIColor {
        get {
            return UIColor.init(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
        }
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
