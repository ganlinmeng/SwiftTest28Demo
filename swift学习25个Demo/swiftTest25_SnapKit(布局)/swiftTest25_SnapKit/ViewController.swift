//
//  ViewController.swift
//  swiftTest25_SnapKit
//
//  Created by 李俊成 on 2018/5/23.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewTest = UIView()
    var view1 = UIView()
    var label1 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreatUI()
        label1.text = "dfvasdfasdfafasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasddfvasdfasdfafasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasddfvasdfasdfafasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasd"
        label1.numberOfLines = 0;
    }
    func CreatUI() {
        // 避免循环引用
        weak var weakSelf : ViewController? = self
        viewTest.backgroundColor = UIColor.red
        view1.backgroundColor = UIColor.gray
        label1.backgroundColor = UIColor.green
        view.addSubview(viewTest)
        view.addSubview(view1)
        view.addSubview(label1)
        
        // 布局 和masonry 类似
        
        viewTest.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.center.equalTo(weakSelf!.view)
        }
        view1.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(viewTest)
            make.top.equalTo((weakSelf?.view)!).offset(20)
            make.right.equalTo((weakSelf?.view)!).offset(-20)
        }
        label1.snp.makeConstraints { (make) -> Void in
            make.left.equalTo((weakSelf?.view)!).offset(20)
            make.top.equalTo(viewTest.snp.bottom).offset(20)
            make.right.equalTo(view1)
//            make.height.equalTo(100)
            make.height.lessThanOrEqualTo(40)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

