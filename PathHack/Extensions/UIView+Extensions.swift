//
//  UIView+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

extension UIView {
    func makeShadow(shadowColor: UIColor) {
//        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = shadowColor.cgColor
        layer.layoutIfNeeded()
    }
}
