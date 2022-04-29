//
//  QRCodeViewController.swift
//  PathHack
//
//  Created by Lee on 2022/04/30.
//

import UIKit

class QRCodeViewController: UIViewController {
  
  // MARK: - Property
  
  private let vQRCode: QRCodeView
  private let dismissButton = UIButton()
  
  
  // MARK: - Life Cycle
  
  init(QRCode: String) {
    self.vQRCode = QRCodeView(QRCode: QRCode)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
}



// MARK: - UI

extension QRCodeViewController {
  private func setUI() {
      view.backgroundColor = .white
    
    vQRCode.layer.cornerRadius = 8
    vQRCode.clipsToBounds = true
    
    dismissButton.addTarget(self, action: #selector(dismissDidTap), for: .touchUpInside)
    dismissButton.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 2))
  }
  
  @objc private func dismissDidTap() {
    dismiss(animated: true)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [vQRCode, dismissButton].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      vQRCode.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      vQRCode.widthAnchor.constraint(equalToConstant: 200),
      vQRCode.heightAnchor.constraint(equalToConstant: 200),
      
      dismissButton.topAnchor.constraint(equalTo: vQRCode.bottomAnchor, constant: 40),
      dismissButton.widthAnchor.constraint(equalToConstant: 80),
      dismissButton.heightAnchor.constraint(equalToConstant: 80)
    ])
  }
}
