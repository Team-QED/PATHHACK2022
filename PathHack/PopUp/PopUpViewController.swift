//
//  PopUpViewController.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit
import Gifu

class PopUpViewController: UIViewController {
    
    private lazy var bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0.2
        $0.isUserInteractionEnabled = true
    }
    private let fireworkImageView = GIFImageView()
    private let leftBadgeImageView = UIImageView().then {
        $0.image = UIImage(named: "book_gold")
        $0.contentMode = .scaleAspectFit
    }
    private let rightBadgeImageView = UIImageView().then {
        $0.image = UIImage(named: "coding_gold")
        $0.contentMode = .scaleAspectFit
    }
    private let textLabel = UIButton().then {
        $0.setTitle("당신, 알고보니 교양있는 개발자!", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.titleLabel?.font = .mySystemFont(ofSize: 23, weight: .bold)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.sizeToFit()
    }
    
    override func loadView() {
        super.loadView()
        attribute()
        setupUI()
    }
    
    private func animations(willOpen: Bool) {
        if willOpen {
            UIView.animate(withDuration: 0.5) {
                self.bgView.alpha = 0.6
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.bgView.alpha = 0
                self.leftBadgeImageView.alpha = 0
                self.rightBadgeImageView.alpha = 0
                self.fireworkImageView.alpha = 0
                self.textLabel.alpha = 0
            } completion: { _ in
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    private func badgeAnimation() {
        UIView.animate(withDuration: 2.0) {
            self.leftBadgeImageView.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.width / 2) - 15, y: 0)
            self.rightBadgeImageView.transform = CGAffineTransform(translationX: -(UIScreen.main.bounds.width / 2) + 15, y: 0)
        } completion: { _ in
            UIView.animate(withDuration: 2.0) {
                self.view.addSubview(self.fireworkImageView)
                self.fireworkImageView.snp.makeConstraints {
                    $0.center.equalToSuperview()
                    $0.width.height.equalTo(300)
                }
                self.fireworkImageView.animate(withGIFNamed: "firework", animationBlock: {
                    print("It's animating!")
                })
                self.view.addSubview(self.textLabel)
                self.textLabel.snp.makeConstraints {
                    $0.centerX.equalToSuperview()
                    $0.top.equalTo(self.leftBadgeImageView.snp.bottom).offset(5)
                }
            } completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.animations(willOpen: false)
                }
            }
        }
    }
    
    private func attribute() {
        DispatchQueue.main.async {
            self.badgeAnimation()
        }
    }
    
    private func setupUI() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(leftBadgeImageView)
        leftBadgeImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(25)
            $0.width.height.equalTo(100)
        }
        
        view.addSubview(rightBadgeImageView)
        rightBadgeImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-25)
            $0.width.height.equalTo(100)
        }
    }
}
