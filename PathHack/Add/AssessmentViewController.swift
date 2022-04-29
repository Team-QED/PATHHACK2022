//
//  AssessmentViewController.swift
//  PathHack
//
//  Created by UPs Lee on 2022/04/30.
//

import UIKit
import SnapKit

class AssessmentViewController: UIViewController {
    private let baseView = UIView()
    private let confirmLabel = UILabel()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private let reportButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
        
    }
    
    private func setUI() {
        self.baseView.backgroundColor = .appColor(.daisyColor)
        self.view.addSubview(self.baseView)
        
        self.confirmLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        self.confirmLabel.textAlignment = .left
        self.baseView.addSubview(self.confirmLabel)
        
        self.collectionView.register(AssessmentCollectionViewCell.self, forCellWithReuseIdentifier: AssessmentCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.baseView.addSubview(self.collectionView)
        
        self.reportButton.backgroundColor = .appColor(.lightGrayColor)
        self.reportButton.setTitle("제출", for: .normal)
        self.reportButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        self.reportButton.addTarget(self, action: #selector(didTapReportButton), for: .touchUpInside)
        self.view.addSubview(self.reportButton)
    }
    
    private func setConstraint() {
        self.baseView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top).offset(40)
            make.leading.equalTo(self.view.snp.leading).offset(8)
            make.trailing.equalTo(self.view.snp.trailing).offset(-8)
            make.height.equalTo(160)
        }
        
        self.confirmLabel.snp.makeConstraints { make in
            make.top.equalTo(self.baseView.snp.top).offset(16)
            make.leading.equalTo(self.baseView.snp.leading).offset(24)
            make.trailing.equalTo(self.baseView.snp.trailing).offset(-24)
        }
    
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.confirmLabel.snp.bottom).offset(32)
        }
        
        self.reportButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(40)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    @objc private func didTapReportButton() {
        
    }
    
}
extension AssessmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssessmentCollectionViewCell.identifier, for: indexPath) as? AssessmentCollectionViewCell else { fatalError() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension AssessmentViewController: UICollectionViewDelegateFlowLayout {
    
}
