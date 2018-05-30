//
//  ViewController.swift
//  swiftTest11_VideoBackground
//
//  Created by 李俊成 on 2018/5/15.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    var loginBtn = UIButton()
    var signupBtn = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        loginBtn.frame = CGRect(x: 10, y: 100, width: 100, height: 50)
        signupBtn.frame = CGRect(x: 10, y: 200, width: 100, height: 50)
        loginBtn.backgroundColor = UIColor.red
        signupBtn.backgroundColor = UIColor.green
        loginBtn.setTitle("登录", for: .normal)
        signupBtn.setTitle("注册", for: .normal)
        view.addSubview(loginBtn)
        view.addSubview(signupBtn)
        loginBtn.layer.cornerRadius = 4
        signupBtn.layer.cornerRadius = 4
    }
    func setupVideoBackground()  {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






































