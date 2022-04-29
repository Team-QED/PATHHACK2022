//
//  MainViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private let talents: [TalentType] = [.developer, .delivery, .workout]
    
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    
    private lazy var mainScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.delegate = self
    }
    private let mainView = UIView()
    private let mainLineView = UIView().then {
        $0.backgroundColor = .appColor(.daisyColor)
    }
    private let titleLabel = UILabel().then {
        $0.text = "당신은\n\n런닝왕"
        $0.textColor = .appColor(.darkGreenColor)
        $0.font = .systemFont(ofSize: 36, weight: .bold)
        $0.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: $0.text ?? "")
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: -0.35,
            range: NSRange(location: 0, length: attributedString.length)
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = -0.1
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
        $0.attributedText = attributedString
        $0.sizeToFit()
    }
    private let subtitleLabel = UILabel().then {
        $0.text = """
        어제의
        당신은
        러닝을
        가장
        완벽하게
        하셨군요!
        """
        $0.textColor = .appColor(.darkGreenColor)
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: $0.text ?? "")
        attributedString.addAttribute(
            NSAttributedString.Key.kern,
            value: -0.35,
            range: NSRange(location: 0, length: attributedString.length)
        )
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = -0.1
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )
        $0.attributedText = attributedString
        $0.sizeToFit()
    }
    private let mainCircleBgView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 90
        $0.clipsToBounds = true
    }
    private lazy var addButton = UIButton(type: .system).then {
        $0.setTitle("오늘 하루 평가", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .mySystemFont(ofSize: 14, weight: .bold)
        $0.backgroundColor = .appColor(.lightGreenColor)
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        $0.makeShadow(shadowColor: .gray)
    }
    
    private lazy var secondView = UIView().then {
        $0.backgroundColor = .appColor(.daisyColor)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapSecondView)))
    }
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 65
        $0.clipsToBounds = true
        $0.layer.zPosition = 1
        $0.isUserInteractionEnabled = true
    }
    
    private lazy var secondCheckLabel = UILabel().then {
        $0.text = "아니쥬님\n당신의 능력을 확인해보세요."
        $0.textColor = .black
        $0.font = .mySystemFont(ofSize: 18, weight: .medium)
        $0.numberOfLines = 2
        let attributedString = NSMutableAttributedString(string: $0.text!)
        attributedString.addAttribute(
            .font,
            value: UIFont.mySystemFont(ofSize: 13, weight: .regular),
            range: ($0.text! as NSString).range(of: "당신의 능력을 확인해보세요.")
        )
        $0.attributedText = attributedString
    }
    private let secondCheckSubLabel = UILabel().then {
        $0.text = "→ 확인하러 가기"
        $0.textColor = .black
        $0.font = .mySystemFont(ofSize: 12, weight: .regular)
    }
    
    private let thirdView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
    }
    private let thirdTitleLabel = UILabel().then {
        $0.text = "내가 얻은 뱃지"
        $0.textColor = .black
        $0.font = .mySystemFont(ofSize: 20, weight: .bold)
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
        $0.showsHorizontalScrollIndicator = false
        $0.register(BadgeCircleCell.self, forCellWithReuseIdentifier: BadgeCircleCell.identifier)
    }
    
    private let todayView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
    }
    private let todayImageView = UIImageView().then {
        $0.image = UIImage(named: "reading_bg")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.alpha = 0.8
    }
    private let todayTitleLabel = UILabel().then {
        $0.text = "어제의 나는?"
        $0.textColor = .white
        $0.font = .mySystemFont(ofSize: 17, weight: .bold)
        $0.makeShadow(shadowColor: .gray)
    }
    private let todayLabel = UILabel().then {
        $0.text = "당신은 독서왕!"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .mySystemFont(ofSize: 38, weight: .bold)
        $0.makeShadow(shadowColor: .gray)
    }
    
    private let recentBadgeView = UIView().then {
        $0.backgroundColor = .white
        $0.makeShadow(shadowColor: .gray)
    }
    private let recentBadgeTitleLabel = UILabel().then {
        $0.text = "최근의 나는?"
        $0.textColor = .black
        $0.font = .mySystemFont(ofSize: 20, weight: .bold)
    }
    private let recentLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: 160, height: 190)
        $0.minimumLineSpacing = 15
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    private lazy var recentBadgeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: recentLayout).then {
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.register(RecentBadgeCell.self, forCellWithReuseIdentifier: RecentBadgeCell.identifier)
    }
    
    private let talentLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = CGSize(width: UIScreen.main.bounds.width - 30, height: 260)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
        $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    private lazy var talentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: talentLayout).then {
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.register(TalentCell.self, forCellWithReuseIdentifier: TalentCell.identifier)
    }
    private lazy var pageControl = UIPageControl().then {
        $0.currentPage = 0
        $0.numberOfPages = talents.count
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func moveAnimate(_ y: CGFloat) {
        let delay = 2.5
        mainLineView.transform = CGAffineTransform(translationX: -y / delay, y: 0)
        mainCircleBgView.transform = CGAffineTransform(translationX: -y / delay, y: 0)
        titleLabel.transform = CGAffineTransform(translationX: -y / delay, y: 0)
        subtitleLabel.transform = CGAffineTransform(translationX: -y / delay, y: 0)
    }
    
    private func attribute() {
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        let margins: CGFloat = 15
        
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainScrollView.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.equalTo(mainScrollView)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(UIScreen.main.bounds.height)
        }
        
        mainView.addSubview(mainLineView)
        mainLineView.snp.makeConstraints {
            $0.top.equalTo(mainView).offset(-300)
            $0.leading.equalToSuperview().offset(margins * 3)
            $0.width.equalTo(60)
            $0.height.equalTo(UIScreen.main.bounds.height + 300)
        }
        
        mainView.addSubview(mainCircleBgView)
        mainCircleBgView.snp.makeConstraints {
            $0.top.equalTo(mainView).inset(margins * 2 + UIApplication.shared.safeAreaTop)
            $0.trailing.equalTo(mainView).inset(margins * 2)
            $0.width.height.equalTo(180)
        }
        
        mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(mainCircleBgView.snp.bottom).offset(margins - 2)
            $0.trailing.equalTo(mainCircleBgView.snp.centerX).offset(-10)
            $0.width.equalTo(40)
        }
        
        mainView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(mainCircleBgView.snp.bottom).offset(margins)
            $0.leading.equalTo(mainCircleBgView.snp.centerX)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-margins)
        }
        
        mainView.addSubview(addButton)
        addButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(mainView).inset(margins * 3)
            $0.width.equalTo(140)
            $0.height.equalTo(46)
        }
        
        mainScrollView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom).offset(margins)
            $0.leading.equalTo(view).offset(margins)
            $0.width.height.equalTo(130)
        }
        
        mainScrollView.addSubview(secondView)
        secondView.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.centerX)
            $0.trailing.equalTo(view).offset(-margins)
            $0.height.equalTo(120)
        }
        
        mainScrollView.addSubview(secondCheckLabel)
        secondCheckLabel.snp.makeConstraints {
            $0.centerY.equalTo(secondView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(margins)
            $0.trailing.equalTo(secondView).inset(margins)
        }
        
        mainScrollView.addSubview(secondCheckSubLabel)
        secondCheckSubLabel.snp.makeConstraints {
            $0.trailing.bottom.equalTo(secondView).inset(margins)
        }
        
        mainScrollView.addSubview(thirdView)
        thirdView.snp.makeConstraints {
            $0.top.equalTo(secondView.snp.bottom).offset(margins * 2)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.height.equalTo(190)
        }
        
        mainScrollView.addSubview(thirdTitleLabel)
        thirdTitleLabel.snp.makeConstraints {
            $0.top.equalTo(thirdView).offset(margins * 2)
            $0.leading.equalTo(thirdView).offset(margins)
        }
        
        mainScrollView.addSubview(thirdBadgeCollectionView)
        thirdBadgeCollectionView.snp.makeConstraints {
            $0.top.equalTo(thirdTitleLabel.snp.bottom).offset(margins)
            $0.leading.trailing.equalTo(thirdView)
            $0.bottom.equalTo(thirdView).offset(-margins * 2)
        }
        
        mainScrollView.addSubview(todayView)
        todayView.snp.makeConstraints {
            $0.top.equalTo(thirdView.snp.bottom).offset(margins * 2)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.height.equalTo(260)
        }
        
        mainScrollView.addSubview(todayImageView)
        todayImageView.snp.makeConstraints {
            $0.edges.equalTo(todayView)
        }
        
        mainScrollView.addSubview(todayTitleLabel)
        todayTitleLabel.snp.makeConstraints {
            $0.top.equalTo(todayView).offset(margins * 2)
            $0.leading.equalTo(todayView).offset(margins)
        }
        
        mainScrollView.addSubview(todayLabel)
        todayLabel.snp.makeConstraints {
            $0.center.equalTo(todayView)
        }
        
        mainScrollView.addSubview(recentBadgeView)
        recentBadgeView.snp.makeConstraints {
            $0.top.equalTo(todayView.snp.bottom).offset(margins * 2)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.height.equalTo(300)
        }
        
        mainScrollView.addSubview(recentBadgeTitleLabel)
        recentBadgeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(recentBadgeView).offset(margins * 2)
            $0.leading.equalTo(recentBadgeView).offset(margins)
        }
        
        mainScrollView.addSubview(recentBadgeCollectionView)
        recentBadgeCollectionView.snp.makeConstraints {
            $0.top.equalTo(recentBadgeTitleLabel.snp.bottom).offset(margins / 2)
            $0.leading.trailing.equalTo(recentBadgeView)
            $0.bottom.equalTo(recentBadgeView).offset(-margins * 2)
        }
        
        mainScrollView.addSubview(talentCollectionView)
        talentCollectionView.snp.makeConstraints {
            $0.top.equalTo(recentBadgeView.snp.bottom).offset(margins * 2)
            $0.leading.trailing.equalTo(view).inset(margins)
            $0.bottom.equalTo(mainScrollView).offset(-margins * 2)
            $0.height.equalTo(260).priority(999)
        }
        
        mainScrollView.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(talentCollectionView).offset(-5)
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == thirdBadgeCollectionView {
            return badgeData.count
        } else if collectionView == recentBadgeCollectionView {
            return recordData.count
        } else {
            return talents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case thirdBadgeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCircleCell.identifier, for: indexPath) as! BadgeCircleCell
            cell.setProperties(badge: badgeData[indexPath.item])
            return cell
        case recentBadgeCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentBadgeCell.identifier, for: indexPath) as! RecentBadgeCell
            cell.setProperties(record: recordData[indexPath.item])
            return cell
        case talentCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TalentCell.identifier, for: indexPath) as! TalentCell
            cell.setProperties(talentType: talents[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            moveAnimate(scrollView.contentOffset.y)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == talentCollectionView {
            let currentPage = Int(round(targetContentOffset.pointee.x / view.frame.width))
            self.currentPage = currentPage
        }
    }
}

// MARK: - Target
extension MainViewController {
    @objc private func tapAddButton() {
        // 오늘 하루 평가 버튼 클릭
        let vc = AddViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func tapSecondView() {
        let vc = DetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
