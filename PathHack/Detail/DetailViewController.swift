//
//  DetailViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit

class DetailViewController: UIViewController {
    private let detailTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else { fatalError() }
        //    cell.drawCell(badgeData: <#T##[Dictionary<String, Any>]#>)
        return cell
    }
    
    
}
