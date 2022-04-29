//
//  MainViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let badges = [
        Badge(name: "뱃지1", percent: 55),
        Badge(name: "뱃지2", percent: 5),
        Badge(name: "뱃지3", percent: 24),
        Badge(name: "뱃지4", percent: 60),
        Badge(name: "뱃지5", percent: 40),
    ]
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
    private let mainView = UIView()
    private let titleLabel = UILabel().then {
        $0.text = "자전거"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 47, weight: .black)
        $0.numberOfLines = 2
    }
    private let mainCircleBgView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 1, green: 0.4941176471, blue: 0.4941176471, alpha: 1)
        $0.layer.cornerRadius = UIScreen.main.bounds.width * 1.3 / 2
        $0.clipsToBounds = true
    }
    private let badgeView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.7294117647, green: 0.831372549, blue: 0.8862745098, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.makeShadow(shadowColor: .lightGray)
    }
    private lazy var badgeTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.register(MainBadgeCell.self, forCellReuseIdentifier: MainBadgeCell.identifier)
    }
    private lazy var addButton = UIButton(type: .system).then {
        $0.setTitle("오늘 하루 평가", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        $0.backgroundColor = #colorLiteral(red: 0.4039215686, green: 0.4862745098, blue: 0.7803921569, alpha: 1)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private let secondView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .lightGray)
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 50
        $0.clipsToBounds = true
    }
    
    private let secondCheckLabel = UILabel().then {
        $0.text = "아니쥬님의 역량\n확인 →"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.numberOfLines = 2
    }
    
    private let thirdView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .lightGray)
    }
    private let thirdTitleLabel = UILabel().then {
        $0.text = "내가 얻은 뱃지"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func startAnimation() {
        
    }
    
    private func attribute() {
        view.backgroundColor = .white
    }

    private func setupUI() {
        let guide = view.safeAreaLayoutGuide
        let margins: CGFloat = 15
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.leading.equalTo(scrollView)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(UIScreen.main.bounds.height)
        }
        
        mainView.addSubview(mainCircleBgView)
        mainCircleBgView.snp.makeConstraints {
            $0.top.leading.equalTo(mainView).offset(margins * 2)
            $0.width.height.equalTo(UIScreen.main.bounds.width * 1.3)
        }
        
        mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalTo(mainView).offset(margins * 10)
            $0.leading.trailing.equalTo(mainView).offset(margins * 2)
        }
        
        mainView.addSubview(badgeView)
        badgeView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.centerY).offset(margins)
            $0.leading.equalTo(mainView).offset(margins)
            $0.width.equalTo(UIScreen.main.bounds.width / 1.5)
            $0.height.equalTo(240)
        }
        
        badgeView.addSubview(badgeTableView)
        badgeTableView.snp.makeConstraints {
            $0.top.bottom.equalTo(badgeView).inset(20)
            $0.leading.trailing.equalTo(badgeView)
        }
        
        mainView.addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(mainView).inset(margins * 2)
            $0.width.equalTo(120)
            $0.height.equalTo(42)
        }
        
        scrollView.addSubview(secondView)
        secondView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.height.equalTo(150)
        }
        
        scrollView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.centerY.equalTo(secondView)
            $0.leading.equalTo(secondView).offset(margins)
            $0.width.height.equalTo(100)
        }
        
        scrollView.addSubview(secondCheckLabel)
        secondCheckLabel.snp.makeConstraints {
            $0.centerY.equalTo(secondView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(margins)
            $0.trailing.equalTo(secondView).inset(margins)
        }
        
        scrollView.addSubview(thirdView)
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.bottom.equalTo(scrollView).offset(-margins * 2)
            $0.height.equalTo(300)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainBadgeCell.identifier, for: indexPath) as! MainBadgeCell
        cell.setProperties(badge: badges[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
