//
//  ChannelViewController.swift
//  swiftTest21_slideOutMenu
//
//  Created by 李俊成 on 2018/5/19.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController {
    var btn1 = UIButton()
    var btn2 = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .setUpUI()
        self.view.backgroundColor = UIColor.red
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    func setUpUI() {
        btn1.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        btn1.backgroundColor = UIColor.gray
        btn1.addTarget(self, action: #selector(btn1Click), for: .touchUpInside)
        view.addSubview(btn1)
        
        btn2.frame = CGRect(x: 0, y: 200, width: 100, height: 50)
        btn2.backgroundColor = UIColor.green
        btn2.addTarget(self, action: #selector(btn2Click), for: .touchUpInside)
        view.addSubview(btn2)
        self.revealViewController().rearViewRevealWidth = 100
    }
    @objc func btn1Click() {
        let ui = ViewController1()
        let main = UINavigationController(rootViewController: ui)
        self.revealViewController().pushFrontViewController(main, animated: true)
    }
    @objc func btn2Click() {
        let ui = ChangeViewController()
        let main = UINavigationController(rootViewController: ui)
        self.revealViewController().pushFrontViewController(main, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
