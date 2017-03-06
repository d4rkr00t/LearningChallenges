//
//  UIColorExtension.swift
//  MaterialColourPalette
//
//  Created by Stanislav Sysoev on 3/1/17.
//  Copyright © 2017 Stanislav Sysoev. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
}
