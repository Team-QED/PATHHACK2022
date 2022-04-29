//
//  TalentCell.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

class TalentCell: UICollectionViewCell {
    
    static let identifier = "TalentCell"
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "reading_bg")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
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
    
    private func attribute() {
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}
