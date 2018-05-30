//
//  RootTabBarController.swift
//  swiftTest23_TabbarApp
//
//  Created by 李俊成 on 2018/5/21.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    var backView = UIView()
    var items : NSArray = []
    let NameArr = ["首页","分类","购物车","我的"]
    let PicArr = ["Home","Home","Home","Home"]
    let PicSelectArr = ["Game","Game","Game","Game"]
    let VCArr = [ViewController(), FirstVC(),SecondVC(),ThirdVC()]
    // 初始化数组
    var NavVCArr : [NSObject] = [NSObject]()
    var nav : UINavigationController? = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreatTabBar()
        
    }
    func CreatTabBar() {
       
        backView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 49)
        
        for M in 0..<VCArr.count {
            nav = UINavigationController(rootViewController: (VCArr[M] as AnyObject as! UIViewController))
            nav?.tabBarItem.title = NameArr[M]
            nav?.tabBarItem.image = UIImage(named: PicArr[M])
            nav?.tabBarItem.selectedImage = UIImage(named: PicSelectArr[M])
            VCArr[M].title = NameArr[M]
            NavVCArr.append(nav!)
        }
        // 添加工具栏
        self.viewControllers = NavVCArr as? [UIViewController]
        for i in 0..<NavVCArr.count {
            /*
             (items[i] as AnyObject) 相当于 self.navigationController?
             **/
            // 设置导航栏的背景图片(优先级高)
            (NavVCArr[i] as AnyObject).navigationBar.setBackgroundImage(UIImage(named: "navBar"), for: .default)
            // 设置导航栏的背景颜色(优先级低)
            (NavVCArr[i] as AnyObject).navigationBar.barTintColor = UIColor.orange
            // 设置导航栏的字体颜色
            (NavVCArr[i] as AnyObject).navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName: UIColor.red.cgColor] as [NSAttributedStringKey : Any]

        }
        // tabBar底部工具栏背景颜色
        self.tabBar.barTintColor = UIColor.white
//        self.tabBar.backgroundColor = UIColor.brown
        // 设置tabBar工具栏字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white] as [NSAttributedStringKey : Any] , for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.red] as [NSAttributedStringKey : Any], for: .selected)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}







































