//
//  cameraView.swift
//  swiftTest5
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import AVFoundation
class cameraView: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var cameraView = UIView()
    var tempImageView = UIImageView()
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        setUpUI()
    }
    func setUpUI() {
        cameraView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height * 0.5)
        cameraView.backgroundColor = UIColor .yellow
        self.view .addSubview(cameraView)
        tempImageView.frame = CGRect.init(x: self.view.frame.width / 4, y: self.view.frame.height * 0.5, width: self.view.frame.width/2 , height:  self.view.frame.height * 0.5)
        tempImageView.backgroundColor = UIColor .red
        self.view.addSubview(tempImageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: .video)

        var error:NSError?
        var inPut : AVCaptureDeviceInput!
        
        do{
            inPut = try AVCaptureDeviceInput(device: backCamera!)
            
        }
        catch let error1 as NSError {
            error = error1
            inPut = nil
        }
        if (error == nil && captureSession?.canAddInput(inPut) != nil) {
            captureSession?.addInput(inPut)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput!) != nil) {
                captureSession?.addOutput(stillImageOutput!)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
        }
        
    }
    func didPressTakePhoto()  {
        if let videoConnection = stillImageOutput?.connection(with: .video) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (sampleBuffer, error) in
                if sampleBuffer != nil {
                    let iamgeData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider = CGDataProvider(data: iamgeData as! CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    let image = UIImage(cgImage:cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false
                    
                }
            })
        }
    }
    
    var didTakePhoto = Bool()
    func didPressTakeAnother()  {
        if didTakePhoto {
            tempImageView.isHidden = true
            didTakePhoto = false
        }else {
            captureSession?.startRunning()
            didTakePhoto = false
            didPressTakePhoto()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }

}





























































