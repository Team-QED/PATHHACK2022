//
//  AssessmentCollectionViewCell.swift
//  PathHack
//
//  Created by UPs Lee on 2022/04/30.
//

import UIKit
protocol AssessmentCollectionViewCellDelegate: class {
    
}

class AssessmentCollectionViewCell: UICollectionViewCell {
    static let identifier = "AssessmentCollectionViewCell"
    weak var delegate: AssessmentCollectionViewCellDelegate?
    
    private let button = UIButton()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
    }
    
    private func setConstraint() {
        
    }
}
