//
//  DetailTableViewCell.swift
//  PathHack
//
//  Created by UPs Lee on 2022/04/29.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
    
    private var badgeImageView = UIImageView()
    private var targetLabel = UILabel()
    private var progressBaseView = UIView()
    private var progressView = UIView()
    private var currRecordLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        self.setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        self.contentView.addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.height.equalTo(64)
            make.leading.equalToSuperview().offset(48)
            make.centerY.equalToSuperview()
        }
       
        self.contentView.addSubview(targetLabel)
        targetLabel.snp.makeConstraints { make in
            make.leading.equalTo(badgeImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(64)
            make.bottom.equalTo(self.badgeImageView.snp.centerY).offset(-4)
            make.height.equalTo(16)
        }
        
        self.contentView.addSubview(progressBaseView)
        progressBaseView.snp.makeConstraints { make in
            make.top.equalTo(badgeImageView.snp.centerY)
            make.leading.equalTo(targetLabel.snp.leading)
            make.height.equalTo(12)
            make.trailing.equalToSuperview().offset(-64)
        }
        
        self.contentView.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.leading.height.equalTo(progressBaseView)
        }
        
        self.contentView.addSubview(currRecordLabel)
        currRecordLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBaseView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-64)
            make.height.equalTo(16)
        }
    }
    
    private func setUI() {
        badgeImageView.contentMode = .scaleAspectFit
        
        targetLabel.textColor = .black
        targetLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        currRecordLabel.textColor = .darkGray
        currRecordLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        currRecordLabel.textAlignment = .right
        
        progressBaseView.backgroundColor = .appColor(.daisyColor)
        progressView.backgroundColor = .appColor(.normalGreenColor)
        
    }
    
    private func updateProgressbar(percentage: Double) {
        progressView.snp.makeConstraints { make in
            make.width.equalTo(progressBaseView.snp.width).multipliedBy(percentage)
        }
    }
    
    func drawCell(badgeData: Badge) {
        badgeImageView.image = UIImage(named: badgeData.imageName)
        targetLabel.text = badgeData.inType.name
        currRecordLabel.text = badgeData.percentStr
        updateProgressbar(percentage: badgeData.percent)
    }
}

