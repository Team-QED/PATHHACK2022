//
//  CertificationViewController.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

class CertificationViewController: UIViewController {
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 80, height: 80)
        $0.minimumLineSpacing = 15
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    private lazy var badgeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.register(BadgeCircleCell.self, forCellWithReuseIdentifier: BadgeCircleCell.identifier)
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func attribute() {
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(badgeCollectionView)
        badgeCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(guide)
            $0.height.equalTo(80)
        }
    }
}

extension CertificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCircleCell.identifier, for: indexPath) as! BadgeCircleCell
        return cell
    }
}
