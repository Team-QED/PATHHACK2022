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
    
    private let sendButton = UIButton()
    
    var selectedIndex: Int?
    var descriptionArr = ["매우\n아니다",
                          "아니다",
                          "보통이다",
                          "그렇다",
                          "매우\n그렇다"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
        
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        
        self.baseView.clipsToBounds = true
        self.baseView.layer.cornerRadius = 8
        self.baseView.backgroundColor = .appColor(.daisyColor)
        self.view.addSubview(self.baseView)
        
        self.confirmLabel.text = "우쭈쭈쭈쭈"
        self.confirmLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.confirmLabel.textAlignment = .left
        self.baseView.addSubview(self.confirmLabel)
        
        self.collectionView.register(AssessmentCollectionViewCell.self, forCellWithReuseIdentifier: AssessmentCollectionViewCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .clear
        self.baseView.addSubview(self.collectionView)
        
        self.sendButton.backgroundColor = .appColor(.lightGreenColor)
        self.sendButton.setTitle("제출", for: .normal)
        self.sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.sendButton.clipsToBounds = true
        self.sendButton.layer.cornerRadius = 16
        self.sendButton.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        self.view.addSubview(self.sendButton)
    }
    
    private func setConstraint() {
        self.baseView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(56)
            make.leading.equalTo(self.view.snp.leading).offset(8)
            make.trailing.equalTo(self.view.snp.trailing).offset(-8)
            make.height.equalTo(180)
        }
        
        self.confirmLabel.snp.makeConstraints { make in
            make.top.equalTo(self.baseView.snp.top).offset(16)
            make.leading.equalTo(self.baseView.snp.leading).offset(24)
            make.trailing.equalTo(self.baseView.snp.trailing).offset(-24)
        }
    
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.confirmLabel.snp.bottom).offset(24)
            make.leading.equalTo(self.baseView.snp.leading).offset(8)
            make.trailing.equalTo(self.baseView.snp.trailing).offset(-8)
            make.bottom.equalTo(self.baseView.snp.bottom).offset(-24)
        }
        
        self.sendButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.height.equalTo(56)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-80)
        }
    }
    
    @objc private func didTapSendButton() {
        print("넘어가가")
    }
    
}
extension AssessmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssessmentCollectionViewCell.identifier, for: indexPath) as? AssessmentCollectionViewCell else { fatalError() }
        cell.drawCell(description: descriptionArr[indexPath.row])
        if let selectedIdx = selectedIndex {
            cell.isSelect = selectedIdx == indexPath.row
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
        
    }
}

extension AssessmentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0 , left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor((collectionView.frame.width - 32) / 5)
        return CGSize(width: width, height: collectionView.frame.size.height)
    }
}
