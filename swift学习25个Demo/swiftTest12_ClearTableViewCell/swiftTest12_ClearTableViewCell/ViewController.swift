//
//  ViewController.swift
//  swiftTest12_ClearTableViewCell
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        
    }
  @objc  func btnClick()  {
        let clearVC = ClearTableViewController ()
        self.navigationController?.pushViewController(clearVC, animated:true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

