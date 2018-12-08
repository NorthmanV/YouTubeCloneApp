//
//  UIColorExtension.swift
//  YouTubeCloneApp
//
//  Created by Ruslan Akberov on 08/12/2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
