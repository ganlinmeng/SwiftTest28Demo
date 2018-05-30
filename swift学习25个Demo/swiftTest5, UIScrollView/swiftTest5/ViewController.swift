//
//  ViewController.swift
//  swiftTest5
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var scrollView = UIScrollView()
    let leftView = UIView()
    let centerView = cameraView()
    let rightView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI(){
        UIApplication.shared.isStatusBarHidden = true
        scrollView.frame = view.bounds
        scrollView.backgroundColor = UIColor.red
        
        leftView.frame = view.bounds
        leftView.backgroundColor = UIColor.yellow
        
        centerView.view.frame = view.bounds
        centerView.view.backgroundColor = UIColor.blue
        
        rightView.frame = view.bounds
        rightView.backgroundColor = UIColor.gray
        
        view.addSubview(scrollView)
        view.addSubview(leftView)
        view.addSubview(centerView.view)
        view.addSubview(rightView)
        
        scrollView.addSubview(leftView)
        scrollView.addSubview(centerView.view)
        scrollView.addSubview(rightView)

        var centerViewFrame: CGRect = centerView.view.bounds
        centerViewFrame.origin.x = view.frame.width
        centerView.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightView.bounds
        rightViewFrame.origin.x = 2 * view.frame.width
        rightView.frame = rightViewFrame
        
        scrollView.contentSize = CGSize.init(width: view.frame.width * 3, height: view.frame.height)
        scrollView.isPagingEnabled  = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


























