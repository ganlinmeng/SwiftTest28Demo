//
//  ViewController.swift
//  swiftTest1
//
//  Created by 李俊成 on 2018/5/10.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // 定义属性 变量
    let alrtview = JCAlrtView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUPUI()
    }
    func setUPUI() {
//         按键
        let btn = UIButton.init()
        btn.frame = CGRect(x:10,y:100,width:100,height:50)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.backgroundColor = UIColor.red
        btn .addTarget(self, action:#selector(ViewController.btnClick), for:UIControlEvents.touchUpInside)
        btn .setTitle("按钮默认", for: .normal)
        btn.setTitle("按钮按下", for: .highlighted)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.green, for: .highlighted)
        btn.setImage(UIImage(named: "1.jpg"), for: .normal)
        btn.setImage(UIImage(named: "2.jpg"), for: .highlighted)
        view.addSubview(btn)
//        图片
        let path = Bundle.main.path(forResource: "1", ofType: "jpg")
        let imgNormal = UIImage(contentsOfFile: path!)
        let highImage = UIImage(named: "2.jpg")
        let btn1 = UIButton.init(type: .custom)
        btn1.setBackgroundImage(imgNormal, for: .normal)
        btn1.setBackgroundImage(highImage, for: .highlighted)
        btn1.backgroundColor = UIColor.init(patternImage: UIImage(named: "2.jpg")!)
        btn1.frame = CGRect(x: 10, y: 200, width: 100, height: 50)
        view.addSubview(btn1)
//        label
        let lab = UILabel.init(frame: CGRect.init(x: 10, y: 300, width: 100, height: 50))
        lab.backgroundColor = .red
        lab.textColor  = .blue
        lab.text = "label测试"
        lab.textAlignment = .center
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 13)
        lab.highlightedTextColor = UIColor.yellow
        lab.isHighlighted = true
        view.addSubview(lab)
        
    }
    @objc func btnClick() {
        print("安全退出")
        alrtview.showChoice(str: "确认退出吗")
        alrtview.resualtBlock = {(isTrue:Bool) in
            if isTrue {
                print("是的")
            }else {
                print("不是的")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

