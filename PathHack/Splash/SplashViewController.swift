//
//  SplashViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/29.
//

import UIKit
import Then
import SnapKit

class SplashViewController: UIViewController {
    
    private lazy var logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "splash")
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.alpha = 0.6
        visualEffectView.frame = self.view.frame
        $0.addSubview(visualEffectView)
    }
    
    private let titleView = UIView().then {
        $0.backgroundColor = UIColor.appColor(.darkGreenColor).withAlphaComponent(0.95)
        $0.layer.cornerRadius = 6
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "PINNED"
        $0.textColor = UIColor.appColor(.daisyColor)
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        $0.backgroundColor = .clear
    }
    
    private let subLabel = UILabel().then {
        $0.text = "QED"
        $0.textColor = UIColor.white
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.backgroundColor = .clear
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func showMainVC() {
        let naviBar = UINavigationBar.appearance()
        naviBar.tintColor = .black
        naviBar.backItem?.title = "  "

        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)

        let mainVC = MainViewController()
        let naiVC = UINavigationController(rootViewController: mainVC)
        naiVC.modalPresentationStyle = .fullScreen
        let app = UINavigationBarAppearance()
        app.configureWithTransparentBackground()
        app.shadowColor = .clear
        app.backgroundColor = .clear
        app.shadowImage = nil
        app.backgroundImage = nil
        naiVC.navigationController?.navigationBar.standardAppearance = app
        
        self.present(naiVC, animated: true)
    }
    
    private func attribute() {
        view.backgroundColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.showMainVC()
        })
    }

    private func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-96)
            make.leading.trailing.equalToSuperview().inset(70)
            make.height.equalTo(titleView.snp.width)
        }
        
        titleView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        titleView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(12)
        }
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
