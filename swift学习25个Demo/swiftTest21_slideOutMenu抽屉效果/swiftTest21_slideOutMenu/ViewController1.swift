//
//  ViewController.swift
//  swiftTest21_slideOutMenu
//
//  Created by 李俊成 on 2018/5/19.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    var varView = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let item=UIBarButtonItem(title: "菜单", style: UIBarButtonItemStyle.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.leftBarButtonItem=item
        
        self.title = "title"        
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        if varView == 0 {
            self.title = "smail"
        }else {
            self.title = "bad"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}







































