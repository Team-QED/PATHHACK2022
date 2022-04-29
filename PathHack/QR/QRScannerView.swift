//
//  QRScannerView.swift
//  PathHack
//
//  Created by Lee on 2022/04/30.
//

import UIKit
import AVFoundation

protocol QRScannerViewDelegate: AnyObject {
  func qrScanningSucceededWithCode(_ str: String)
}

class QRScannerView: UIView {
  
  weak var delegate: QRScannerViewDelegate?
  
  private var captureSession: AVCaptureSession?
  
  init() {
    super.init(frame: .zero)
    
    captureSession = AVCaptureSession()
    
    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
    let videoInput: AVCaptureDeviceInput
    do {
      videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
      
    } catch {
      print(error.localizedDescription)
      return
    }
    
    if (captureSession?.canAddInput(videoInput) ?? false) {
      captureSession?.addInput(videoInput)
      
    } else {
      captureSession = nil
      return
    }
    
    let metadataOutput = AVCaptureMetadataOutput()
    
    if (captureSession?.canAddOutput(metadataOutput) ?? false) {
      captureSession?.addOutput(metadataOutput)
      
      metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
      metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13, .pdf417]
      
    } else {
      captureSession = nil
      return
    }
    
    self.layer.session = captureSession
    self.layer.videoGravity = .resizeAspectFill
    
    captureSession?.startRunning()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override class var layerClass: AnyClass  {
    return AVCaptureVideoPreviewLayer.self
  }
  
  override var layer: AVCaptureVideoPreviewLayer {
    return super.layer as! AVCaptureVideoPreviewLayer
  }
}

extension QRScannerView: AVCaptureMetadataOutputObjectsDelegate {
  func metadataOutput(
    _ output: AVCaptureMetadataOutput,
    didOutput metadataObjects: [AVMetadataObject],
    from connection: AVCaptureConnection) {
    
    captureSession?.stopRunning()
    
    guard
      let metadataObject = metadataObjects.first,
      let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
      let stringValue = readableObject.stringValue
      else { return }
    AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    
    delegate?.qrScanningSucceededWithCode(stringValue)
  }
}
