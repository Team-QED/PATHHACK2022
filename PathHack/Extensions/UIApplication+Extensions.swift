//
//  UIApplication+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

extension UIApplication {
    var safeAreaTop: CGFloat {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)?
            .safeAreaInsets
            .top ?? 0
    }
    
    var safeAreaBottom: CGFloat {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)?
            .safeAreaInsets
            .bottom ?? 0
    }
}
