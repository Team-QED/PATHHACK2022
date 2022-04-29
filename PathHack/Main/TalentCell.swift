//
//  TalentCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

enum TalentType {
    case delivery
    case developer
    case workout
}

class TalentCell: UICollectionViewCell {
    
    static let identifier = "TalentCell"
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "reading_bg")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private let bottomView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0.7
    }
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .mySystemFont(ofSize: 19, weight: .medium)
        $0.makeShadow(shadowColor: .gray)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(talentType: TalentType) {
        switch talentType {
        case .delivery:
            imageView.image = UIImage(named: "delivery")
            titleLabel.text = "튼튼한 배달원"
            break
        case .developer:
            imageView.image = UIImage(named: "developer")
            titleLabel.text = "교양있는 개발자"
            break
        case .workout:
            imageView.image = UIImage(named: "workout")
            titleLabel.text = "지치지않는 철인"
            break
        }
    }
    
    private func attribute() {
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        
        imageView.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(contentView)
            $0.height.equalTo(contentView).multipliedBy(0.3)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(bottomView)
            $0.bottom.equalTo(contentView).offset(-5)
        }
    }
}
