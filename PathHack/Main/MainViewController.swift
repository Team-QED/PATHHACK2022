//
//  MainViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let badges: [Badge] = [
//        Badge(name: "뱃지1", level: <#T##Badge.Level#>, currRecord: <#T##Double#>,  percent: 55, imageName: "profile"),
//        Badge(name: "뱃지2", percent: 5, imageName: "profile"),
//        Badge(name: "뱃지3", percent: 24, imageName: "profile"),
//        Badge(name: "뱃지4", percent: 60, imageName: "profile"),
//        Badge(name: "뱃지5", percent: 40, imageName: "profile"),
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
    private let mainCircleBgView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = UIScreen.main.bounds.width * 1.3 / 2
        $0.clipsToBounds = true
    }
    private let badgeView = UIView().then {
        $0.backgroundColor = .appColor(.daisyColor)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.makeShadow(shadowColor: .gray)
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
        $0.backgroundColor = .appColor(.lightGreenColor)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private let secondView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
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
        $0.makeShadow(shadowColor: .gray)
    }
    private let thirdTitleLabel = UILabel().then {
        $0.text = "내가 얻은 뱃지"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 80, height: 80)
        $0.minimumLineSpacing = 15
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    private lazy var thirdBadgeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.register(BadgeCircleCell.self, forCellWithReuseIdentifier: BadgeCircleCell.identifier)
    }
    
    private let todayView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
    }
    private let todayTitleLabel = UILabel().then {
        $0.text = "오늘의 나는?"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let todayLabel = UILabel().then {
        $0.text = "당신은 독서왕!"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 38, weight: .black)
    }
    
    private let recentBadgeView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
    }
    private let recentBadgeTitleLabel = UILabel().then {
        $0.text = "최근의 나는?"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let recentLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 160, height: 190)
        $0.minimumLineSpacing = 15
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    private lazy var recentBadgeCollectionVIew = UICollectionView(frame: .zero, collectionViewLayout: recentLayout).then {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.register(RecentBadgeCell.self, forCellWithReuseIdentifier: RecentBadgeCell.identifier)
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
            $0.height.equalTo(160)
        }
        
        scrollView.addSubview(thirdTitleLabel)
        thirdTitleLabel.snp.makeConstraints {
            $0.top.equalTo(thirdView).offset(margins * 2)
            $0.leading.equalTo(thirdView).offset(margins)
        }
        
        scrollView.addSubview(thirdBadgeCollectionView)
        thirdBadgeCollectionView.snp.makeConstraints {
            $0.top.equalTo(thirdTitleLabel.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(thirdView)
            $0.bottom.equalTo(thirdView).offset(-margins)
        }
        
        scrollView.addSubview(todayView)
        todayView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.height.equalTo(260)
        }
        
        scrollView.addSubview(todayTitleLabel)
        todayTitleLabel.snp.makeConstraints {
            $0.top.equalTo(todayView).offset(margins * 2)
            $0.leading.equalTo(todayView).offset(margins)
        }
        
        scrollView.addSubview(todayLabel)
        todayLabel.snp.makeConstraints {
            $0.center.equalTo(todayView)
        }
        
        scrollView.addSubview(recentBadgeView)
        recentBadgeView.snp.makeConstraints {
            $0.top.equalTo(todayView.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.bottom.equalTo(scrollView).offset(-margins * 2)
            $0.height.equalTo(300).priority(999)
        }
        
        scrollView.addSubview(recentBadgeTitleLabel)
        recentBadgeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(recentBadgeView).offset(margins * 2)
            $0.leading.equalTo(recentBadgeView).offset(margins)
        }
        
        scrollView.addSubview(recentBadgeCollectionVIew)
        recentBadgeCollectionVIew.snp.makeConstraints {
            $0.top.equalTo(recentBadgeTitleLabel.snp.bottom).offset(margins / 2)
            $0.leading.trailing.equalTo(recentBadgeView)
            $0.bottom.equalTo(recentBadgeView).offset(-margins * 2)
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

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == thirdBadgeCollectionView {
            return 5
        } else {
           return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case thirdBadgeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCircleCell.identifier, for: indexPath) as! BadgeCircleCell
            cell.setProperties(badge: badges[indexPath.item])
            return cell
        case recentBadgeCollectionVIew:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentBadgeCell.identifier, for: indexPath) as! RecentBadgeCell
            cell.setProperties(badge: badges[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
