//
//  MainBadgeCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/29.
//

import UIKit

class MainBadgeCell: UITableViewCell {
    
    static let identifier = "MainBadgeCell"
    
    private let badgeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    private let badgeProgressBar = UIProgressView().then {
        $0.progressTintColor = .appColor(.lightGreenColor)
    }
    private let percentLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = .systemFont(ofSize: 12, weight: .medium)
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
        badgeLabel.text = badge.inType.name
        badgeProgressBar.setProgress(Float(badge.percent * 100), animated: false)
        percentLabel.text = "\(badge.percent)%"
    }
    
    private func attribute() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    private func setupUI() {
        let margins: CGFloat = 15
        
        contentView.addSubview(badgeLabel)
        badgeLabel.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(contentView).inset(margins / 3)
            $0.width.equalTo(40)
        }
        
        contentView.addSubview(percentLabel)
        percentLabel.snp.makeConstraints {
            $0.top.trailing.bottom.equalTo(contentView).inset(margins / 3)
            $0.width.equalTo(40)
        }
        
        contentView.addSubview(badgeProgressBar)
        badgeProgressBar.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(badgeLabel.snp.trailing)
            $0.trailing.equalTo(percentLabel.snp.leading)
            $0.height.equalTo(10)
        }
    }
}
