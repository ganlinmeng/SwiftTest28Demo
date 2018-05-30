//
//  MainViewController.swift
//  swiftTest21_slideOutMenu
//
//  Created by 李俊成 on 2018/5/19.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class MainViewController: SWRevealViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let one = UINavigationController(rootViewController: ViewController1())
        let view = MainViewController(rearViewController: ChannelViewController(), frontViewController: one)
   
        
        self.navigationController?.present(view!, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
