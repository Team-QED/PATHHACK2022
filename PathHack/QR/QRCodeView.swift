//
//  QRCodeView.swift
//  PathHack
//
//  Created by Lee on 2022/04/30.
//

import UIKit
import AVFoundation

class QRCodeView: UIView {
  
  private let qrCodeImageView = UIImageView()

  init(QRCode: String) {
    super.init(frame: .zero)
    
    guard
      let filter = CIFilter(name: "CIQRCodeGenerator"),
      let data = QRCode.data(using: .isoLatin1, allowLossyConversion: false)
      else { return }

    filter.setValue(data, forKey: "inputMessage")

    guard let ciImage = filter.outputImage else { return }

    let transformed = ciImage.transformed(by: CGAffineTransform.init(scaleX: 10, y: 10))
    let invertFilter = CIFilter(name: "CIColorInvert")
    invertFilter?.setValue(transformed, forKey: kCIInputImageKey)

    let alphaFilter = CIFilter(name: "CIMaskToAlpha")
    alphaFilter?.setValue(invertFilter?.outputImage, forKey: kCIInputImageKey)

    if let outputImage = alphaFilter?.outputImage  {
      qrCodeImageView.tintColor = .white
      qrCodeImageView.backgroundColor = .black
      qrCodeImageView.image = UIImage(ciImage: outputImage, scale: 2.0, orientation: .up)
        .withRenderingMode(.alwaysTemplate)
    }
    
    addSubview(qrCodeImageView)
    qrCodeImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      qrCodeImageView.topAnchor.constraint(equalTo: self.topAnchor),
      qrCodeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      qrCodeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      qrCodeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
