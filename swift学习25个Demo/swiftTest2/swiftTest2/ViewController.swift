//
//  ViewController.swift
//  swiftTest2
//
//  Created by 李俊成 on 2018/5/11.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var playBtn = UIButton()
    var pauseBtn = UIButton()
    var timeLabel = UILabel()
    
    
    var counter = 0.0
    var timer = Timer()
    var ispLaying = false
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPUI()
        
    }
    func setUPUI() {
        timeLabel.textColor = UIColor.red
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.frame = CGRect.init(x: 10, y: 100, width: 100, height: 50)
        view.addSubview(timeLabel)
        
        pauseBtn.setTitle("暂停", for:.normal)
        pauseBtn.backgroundColor = UIColor.red
        pauseBtn.frame  = CGRect.init(x: 10, y: 200, width: 50, height: 50)
        pauseBtn.addTarget(self, action: #selector(pauseBtnClick), for: .touchUpInside)
        view.addSubview(pauseBtn)
        
        playBtn.setTitle("开始", for: .normal)
        playBtn.backgroundColor = UIColor.red
        playBtn.frame = CGRect.init(x: 10, y: 300, width: 50, height: 50)
        playBtn.addTarget(self, action: #selector(playBtnClick), for: .touchUpInside)
        view.addSubview(playBtn)
        
        timer.invalidate()
        ispLaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    @objc  func playBtnClick()  {
        if ispLaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        ispLaying = true
    }
    @objc func pauseBtnClick()  {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        ispLaying = false
    }
    @objc func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
























































