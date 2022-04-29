//
//  RecentBadgeCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

class RecentBadgeCell: UICollectionViewCell {
    
    static let identifier = "RecentBadgeCell"
    
    private let containerView = UIView().then {
        $0.backgroundColor = .appColor(.daisyColor)
        $0.makeShadow(shadowColor: .gray)
    }
    private let badgeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    private let dateLabel = UILabel().then {
        $0.text = "어제"
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let workingLael = UILabel().then {
        $0.text = """
        운동: +7점
        
        독서: +6점
        
        자전거: +5점
        """
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.numberOfLines = 0
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
        let margins: CGFloat = 20
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView).inset(margins)
            $0.trailing.bottom.equalTo(contentView)
        }
        
        contentView.addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.width.height.equalTo(80)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(margins * 2)
            $0.trailing.equalTo(contentView).inset(margins)
        }
        
        contentView.addSubview(workingLael)
        workingLael.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(containerView).inset(margins)
            $0.bottom.equalTo(containerView).offset(-margins)
        }
    }
}
