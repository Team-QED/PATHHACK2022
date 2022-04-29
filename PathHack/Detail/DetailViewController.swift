//
//  DetailViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    private let detailTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
    
    private func setUI() {
        navigationItem.title = "전체 배지"
        
        view.backgroundColor = .white
        detailTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.alwaysBounceVertical = false
        detailTableView.separatorStyle = .none
    }
    
    private func setConstraint() {
        view.addSubview(detailTableView)
        detailTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        badgeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { fatalError() }
        cell.drawCell(badgeData: badgeData[indexPath.row])
        cell.selectionStyle = .none
        cell.isSelected = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
    
    
}
