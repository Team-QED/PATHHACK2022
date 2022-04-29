//
//  AddCollectionViewCell.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit

class AddCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddCollectionViewCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAttribute()
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(inType: Badge.InType) {
        let imageName = inType.rawValue + "_gold"
        self.imageView.image = UIImage(named: imageName)
        self.titleLabel.text = inType.name
        self.titleLabel.font = UIFont.mySystemFont(ofSize: 12, weight: .bold)
    }
}



// MARK: - UI
extension AddCollectionViewCell {
    private func setAttribute() {
        self.contentView.backgroundColor = .white
        self.contentView.makeShadow(shadowColor: .gray)
        
        self.imageView.contentMode = .scaleAspectFit
        self.titleLabel.textColor = .black
        [self.imageView, self.titleLabel].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    private func setConstraint() {
        self.imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.size.equalTo(64)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
