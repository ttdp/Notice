//
//  NoticeType.swift
//  Notice
//
//  Created by Tian Tong on 2019/8/7.
//  Copyright © 2019 TTDP. All rights reserved.
//

import Foundation

public enum NoticeType: String {
    case success
    case warning
    case error
    
    public var icon: UIImage? {
        return UIImage(named: rawValue, in: Bundle(for: Notice.self), compatibleWith: nil)
    }
    
    public var color: UIColor? {
        switch self {
        case .success:
            return NoticeConfig.successColor
        case .warning:
            return NoticeConfig.warningColor
        case .error:
            return NoticeConfig.errorColor
        }
    }
    
}
