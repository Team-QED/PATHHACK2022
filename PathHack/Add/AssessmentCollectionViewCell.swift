//
//  AssessmentCollectionViewCell.swift
//  PathHack
//
//  Created by UPs Lee on 2022/04/30.
//

import UIKit
import SnapKit

class AssessmentCollectionViewCell: UICollectionViewCell {
    static let identifier = "AssessmentCollectionViewCell"
    
    private let roundView = UIView()
    private let descriptionLabel = UILabel()
    
    var isSelect: Bool = false {
        didSet {
            if isSelect {
                roundView.backgroundColor = .appColor(.normalGreenColor)
            } else {
                roundView.backgroundColor = .appColor(.inactiveGrayColor)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.backgroundColor = .clear
        self.roundView.backgroundColor = .appColor(.inactiveGrayColor)
        self.roundView.layer.cornerRadius = self.contentView.frame.size.width / 2 - 4
        self.roundView.clipsToBounds = true
        self.contentView.addSubview(self.roundView)
        
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 11)
        self.descriptionLabel.textAlignment = .center
        self.descriptionLabel.numberOfLines = 0
        self.contentView.addSubview(self.descriptionLabel)
    }
    
    private func setConstraint() {
        self.roundView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top)
            make.leading.equalTo(self.contentView.snp.leading).offset(2)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-2)
            make.height.equalTo(roundView.snp.width)
        }
     
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.roundView.snp.bottom).offset(4)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func drawCell(description: String) {
        descriptionLabel.text = description
    }
}
