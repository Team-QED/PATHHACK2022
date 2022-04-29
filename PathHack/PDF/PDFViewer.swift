//
//  PDFViewer.swift
//  PathHack
//
//  Created by 조현철 on 2022/04/30.
//

import UIKit
import PDFKit

class PDFViewer: UIViewController {
    // MARK: - Properties
    
    private let name: String
    
    private lazy var closeButton = UIButton(type: .system).then {
        let image = UIImage(systemName: "xmark")?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    private let documentPDFView = NonSelectablePDFView().then {
        $0.autoScales = true
    }
    private let documentImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Methods
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        addTakingScreenshotNotification()
        attribute()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeTakingScreenshotNotification()
    }
    
    private func showImageFile(image: UIImage) {
        documentPDFView.removeFromSuperview()
        documentImageView.image = image
    }
    
    private func showPDFFile(data: Data) {
        documentImageView.removeFromSuperview()
        documentPDFView.document = PDFDocument(data: data)
    }
    
    private func addTakingScreenshotNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didTakeScreenshot(notification:)),
            name: UIApplication.userDidTakeScreenshotNotification,
            object: nil
        )
    }
    
    private func removeTakingScreenshotNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.userDidTakeScreenshotNotification,
            object: nil
        )
    }
    
    private func attribute() {
        view.backgroundColor = .white
        if let image = UIImage(named: "certification_\(name)") {
            showImageFile(image: image)
        }
    }
    
    private func setupUI() {
        view.addSubview(documentPDFView)
        documentPDFView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(documentImageView)
        documentImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.width.height.equalTo(30)
        }
    }
}

// MARK: - Selector

private extension PDFViewer {
    @objc private func didTakeScreenshot(notification: Notification) {
    }
    
    @objc private func close() {
        self.dismiss(animated: true)
    }
}

class NonSelectablePDFView: PDFView {
    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.isEnabled = false
        }
        
        super.addGestureRecognizer(gestureRecognizer)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
