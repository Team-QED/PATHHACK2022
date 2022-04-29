//
//  UICollectionView+Extensions.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

extension UICollectionView {
    func setEmptyView(message: String) {
        reloadData()
        let emptyView = UIView(frame: CGRect(x: center.x, y: center.y, width: bounds.size.width, height: bounds.size.height))
        let messageLabel = UILabel().then {
            $0.text = message
            $0.textColor = .gray
            $0.textAlignment = .center
            $0.font = .mySystemFont(ofSize: 17, weight: .medium)
            $0.numberOfLines = 0
        }
        
        backgroundView = emptyView
        
        [messageLabel]
            .forEach { emptyView.addSubview($0) }
        
        messageLabel.snp.makeConstraints {
            $0.center.equalTo(emptyView)
        }
    }
    
    func restore() {
        backgroundView = nil
        reloadData()
    }
}
