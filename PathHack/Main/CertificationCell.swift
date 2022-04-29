//
//  CertificationCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

class CertificationCell: UITableViewCell {
    
    static let identifier = "CertificationCell"
    
    private let badgeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
    }
    private let badgeNameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .mySystemFont(ofSize: 23, weight: .medium)
    }
    private let rightImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        $0.contentMode = .scaleAspectFit
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(badge: Badge) {
        badgeImageView.image = UIImage(named: badge.imageName)
        badgeNameLabel.text = "\(badge.inType.name)(\(badge.level))"
    }
    
    private func attribute() {
        backgroundColor = .white
    }
    
    private func setupUI() {
        let margins: CGFloat = 15
        
        contentView.addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView).offset(margins)
            $0.width.height.equalTo(60)
        }
        
        contentView.addSubview(badgeNameLabel)
        badgeNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(badgeImageView.snp.trailing).offset(8)
        }
        
        contentView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.trailing.equalTo(contentView).offset(-margins)
            $0.width.equalTo(20)
        }
    }
}
