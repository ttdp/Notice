//
//  UILayoutPriority+Extension.swift
//  Notice
//
//  Created by Tian Tong on 2019/8/7.
//  Copyright © 2019 TTDP. All rights reserved.
//

import UIKit

extension UILayoutPriority {
    
    static func +(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue + rhs)
    }
    
    static func -(lhs: UILayoutPriority, rhs: Float) -> UILayoutPriority {
        return UILayoutPriority(lhs.rawValue - rhs)
    }
    
}
