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
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
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
