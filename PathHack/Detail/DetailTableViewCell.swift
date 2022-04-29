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
    private var progressBaseView = UILabel()
    private var progressView = UILabel()
    private var currRecordLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConstraint()
        setUI()
    }
    
    private func setConstraint() {
        badgeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(64)
            make.leading.equalToSuperview().offset(64)
            make.centerY.equalToSuperview()
        }
        self.addSubview(badgeImageView)
        
        targetLabel.snp.makeConstraints { make in
            make.leading.equalTo(badgeImageView.snp.trailing)
            make.trailing.equalToSuperview().offset(64)
            make.bottom.equalTo(self.badgeImageView.snp.centerY)
            make.height.equalTo(16)
        }
        self.addSubview(targetLabel)
        
        progressBaseView.snp.makeConstraints { make in
            make.top.equalTo(badgeImageView.snp.centerY)
            make.leading.equalTo(targetLabel.snp.leading)
            make.height.equalTo(12)
            make.trailing.equalToSuperview().offset(-64)
        }
        self.addSubview(progressBaseView)
        
        progressView.snp.makeConstraints { make in
            make.top.leading.height.equalTo(progressBaseView)
            make.width.equalTo(0)
        }
        self.addSubview(progressView)
        
        currRecordLabel.snp.makeConstraints { make in
            make.top.equalTo(progressBaseView.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(64)
            make.height.equalTo(16)
        }
        self.addSubview(currRecordLabel)
    }
    
    private func setUI() {
        badgeImageView.contentMode = .scaleAspectFit
        
        targetLabel.textColor = .black
        targetLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        currRecordLabel.textColor = .darkGray
        currRecordLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        currRecordLabel.textAlignment = .right
        
        progressBaseView.backgroundColor = .brown
        progressView.backgroundColor = .yellow
        
    }
    
    private func updateProgressbar(percentage: Double) {
        progressView.snp.remakeConstraints() { make in
            make.width.equalTo(progressBaseView.snp.width).multipliedBy(percentage)
        }
    }
    
    func drawCell(badgeData: Badge) {
        badgeImageView.image = UIImage(named: badgeData.imageName)
        targetLabel.text = badgeData.name
        currRecordLabel.text = String(Int(badgeData.currRecord)) + " / " + String(Int(badgeData.level.rawValue))
        
        let percent = badgeData.percent > 1 ? 1 : badgeData.percent
        updateProgressbar(percentage: percent)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
