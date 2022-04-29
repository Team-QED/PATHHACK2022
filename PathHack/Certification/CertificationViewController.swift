//
//  CertificationViewController.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit

class CertificationViewController: UIViewController {
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        let width = floor((UIScreen.main.bounds.width - 48) / 3)
        $0.itemSize = CGSize(width: width, height: width)
        $0.minimumLineSpacing = 12
        $0.minimumInteritemSpacing = 12
        $0.sectionInset = UIEdgeInsets(top: 40, left: 12, bottom: 40, right: 12)
    }
    private lazy var badgeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.dataSource = self
        $0.delegate = self
        $0.register(AddCollectionViewCell.self, forCellWithReuseIdentifier: AddCollectionViewCell.identifier)
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
            $0.edges.equalTo(guide)
        }
    }
}

extension CertificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return badgeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddCollectionViewCell.identifier, for: indexPath) as! AddCollectionViewCell
        cell.setData(inType: badgeData[indexPath.item].inType)
        return cell
    }
}

extension CertificationViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = indexPath.item == 0
        ? "book"
        : indexPath.item == 1
        ? "running"
        : "movie"
        
        let pdfViewer = PDFViewer(name: name)
        pdfViewer.modalPresentationStyle = .fullScreen
        present(pdfViewer, animated: true)
    }
}
