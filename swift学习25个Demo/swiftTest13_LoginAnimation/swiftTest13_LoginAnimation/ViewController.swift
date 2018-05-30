//
//  ViewController.swift
//  swiftTest13_LoginAnimation
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ueserNameTextFiled = UITextField()
    var passWordTextFiled = UITextField()
    
    var loginBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI(){
        
        ueserNameTextFiled.backgroundColor = UIColor.red
        passWordTextFiled.backgroundColor = UIColor.gray
        
        ueserNameTextFiled.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        passWordTextFiled.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
       
        ueserNameTextFiled.layer.cornerRadius = 5
        passWordTextFiled.layer.cornerRadius = 5
       
        loginBtn.layer.cornerRadius = 5
        loginBtn.frame = CGRect(x: 100, y: 300, width: 100, height: 50)
        loginBtn.backgroundColor = UIColor.green
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
       
        view.addSubview(ueserNameTextFiled)
        view.addSubview(passWordTextFiled)
        view.addSubview(loginBtn)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)

        ueserNameTextFiled.frame.origin.x = 0
        passWordTextFiled.frame.origin.x = 0
        loginBtn.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.ueserNameTextFiled.frame.origin.x = self.view.bounds.width/2
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
            self.passWordTextFiled.frame.origin.x = self.view.bounds.width/2
        }) { (ture) in
            print("完成")
        }
        UIView.animate(withDuration: 3, delay: 0.2, options: .curveEaseOut, animations: {
            self.loginBtn.alpha = 1
        }, completion: nil)
    }
   @objc func loginBtnClick(sender : UIButton) {
        let bounds = self.loginBtn.bounds
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveLinear, animations: {
            self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width+60, height: bounds.size.height)
        }) { (ture) in
            self.loginBtn.isEnabled = true
        }
        
    }

}


































