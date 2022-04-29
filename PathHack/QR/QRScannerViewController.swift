//
//  QRScannerViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/30.
//

import UIKit

class QRScannerViewController: UIViewController {
    
    // MARK: - Property
    
    private let titleLabel = UILabel()
    private let vQRScanner = QRScannerView()
    private let dismissButton = UIButton()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraint()
    }
}



// MARK: - UI

extension QRScannerViewController {
    private func setUI() {
        view.backgroundColor = UIColor.appColor(.darkGreenColor)
        
        titleLabel.textAlignment = .center
        titleLabel.text = "패스파인더의 QR 코드를 찍어주세요"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.mySystemFont(ofSize: 18, weight: .bold)
        
        vQRScanner.layer.cornerRadius = 8
        vQRScanner.clipsToBounds = true
        vQRScanner.delegate = self
        
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let tempImage = UIImage(systemName: "chevron.down", withConfiguration: imageConfiguration)
        let tempColorImage = tempImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        dismissButton.setImage(tempColorImage, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissDidTap), for: .touchUpInside)
    }
    
    @objc private func dismissDidTap() {
        dismiss(animated: true)
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        [titleLabel, vQRScanner, dismissButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -24),
            titleLabel.bottomAnchor.constraint(equalTo: vQRScanner.topAnchor, constant: -40),
            
            vQRScanner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vQRScanner.widthAnchor.constraint(equalToConstant: 200),
            vQRScanner.heightAnchor.constraint(equalToConstant: 200),
            
            dismissButton.topAnchor.constraint(equalTo: vQRScanner.bottomAnchor, constant: 40),
            dismissButton.widthAnchor.constraint(equalToConstant: 80),
            dismissButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}



// MARK: - QRScannerViewDelegate

extension QRScannerViewController: QRScannerViewDelegate {
    func qrScanningSucceededWithCode(_ str: String) {
        if str == "pathfinder" {
            guard let navi = presentingViewController as? UINavigationController else { return }
            navi.dismiss(animated: true) {
                navi.popToRootViewController(animated: true)
            }
            
        } else {
            view.backgroundColor = UIColor.red
            UIView.animate(
                withDuration: 1,
                delay: 0,
                options: .curveEaseInOut,
                animations: { [weak self] in
                    self?.view.backgroundColor = UIColor.appColor(.darkGreenColor)
                },
                completion: { [weak self] _ in
                    self?.dismiss(animated: true)
                }
            )
        }
    }
}
