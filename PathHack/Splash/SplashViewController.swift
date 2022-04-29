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
    
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func showMainVC() {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.showMainVC()
        })
    }

    private func setupUI() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
