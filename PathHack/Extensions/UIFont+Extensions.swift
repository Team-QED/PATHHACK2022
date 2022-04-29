//
//  UIFont+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

struct AppFontName {
    static let bold = "NotoSansCJKkr-Bold"
    static let medium = "NotoSansCJKkr-Medium"
    static let regular = "NotoSansCJKkr-Regular"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    @objc class func mySystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: AppFontName.bold, size: size)!
        case .medium:
            return UIFont(name: AppFontName.medium, size: size)!
        case .regular:
            return UIFont(name: AppFontName.regular, size: size)!
        default:
            return UIFont(name: AppFontName.regular, size: size)!
        }
    }
}
