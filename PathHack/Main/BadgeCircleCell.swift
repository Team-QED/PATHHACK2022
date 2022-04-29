//
//  BadgeCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

class BadgeCircleCell: UICollectionViewCell {
    
    static let identifier = "BadgeCircleCell"
    
    private let badgeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(badge: Badge) {
        badgeImageView.image = UIImage(named: badge.imageName)
    }
    
    private func attribute() {
        backgroundColor = .white
    }
    
    private func setupUI() {
        contentView.addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
