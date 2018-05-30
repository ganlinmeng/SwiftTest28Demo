//
//  ViewController.swift
//  swiftTest3
//
//  Created by 李俊成 on 2018/5/11.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var changeFontBtn = UIButton()
    var fontTableView = UITableView()
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI() {
        fontTableView.frame = CGRect.init(x: 0, y: 100, width: 200, height: 300)
        fontTableView.delegate = self
        fontTableView.dataSource = self
        fontTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Fontcell")
        view.addSubview(fontTableView)
        
        changeFontBtn.setTitle("改变", for: .normal)
        changeFontBtn.backgroundColor =  UIColor.red
        changeFontBtn.frame = CGRect.init(x: 100, y: 500, width: 100, height: 50)
        changeFontBtn.addTarget(self, action: #selector(changeFontDidTouch), for: .touchUpInside)
        changeFontBtn.layer.cornerRadius = 25
        view.addSubview(changeFontBtn)
    }
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
     // 组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // 组里多少cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // cell 高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "Fontcell", for: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.blue
        cell.textLabel?.font = UIFont.init(name: self.fontNames[fontRowIndex], size: 16)
        return cell
    }
   @objc func changeFontDidTouch(_ sender:AnyObject) {
    
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


















































