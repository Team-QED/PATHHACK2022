//
//  QRScannerViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/30.
//

import UIKit

class QRScannerViewController: UIViewController {
    
    // MARK: - Property
    
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
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        vQRScanner.layer.cornerRadius = 8
        vQRScanner.clipsToBounds = true
        vQRScanner.delegate = self
        
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let tempImage = UIImage(systemName: "chevron.down", withConfiguration: imageConfiguration)
        let tempColorImage = tempImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        dismissButton.setImage(tempColorImage, for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissDidTap), for: .touchUpInside)
        dismissButton.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 2))
    }
    
    @objc private func dismissDidTap() {
        dismiss(animated: true)
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        [vQRScanner, dismissButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
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
        self.dismiss(animated: false)
    }
}
