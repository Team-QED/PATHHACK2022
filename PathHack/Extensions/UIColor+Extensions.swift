//
//  UIColor+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

enum AssetsColor {
    case daisyColor
    case lightGrayColor
    case inactiveGrayColor
    case lightGreenColor
    case normalGreenColor
    case darkGreenColor
    
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .daisyColor: return #colorLiteral(red: 0.9294117647, green: 0.9019607843, blue: 0.8588235294, alpha: 1)
        case .lightGrayColor: return #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
        case .inactiveGrayColor: return #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.768627584, alpha: 1)
        case .lightGreenColor: return #colorLiteral(red: 0.2549019608, green: 0.4901960784, blue: 0.4784313725, alpha: 1)
        case .normalGreenColor: return #colorLiteral(red: 0.1137254902, green: 0.3607843137, blue: 0.3882352941, alpha: 1)
        case .darkGreenColor: return #colorLiteral(red: 0.1019607843, green: 0.2352941176, blue: 0.2509803922, alpha: 1)
        }
    }
}
