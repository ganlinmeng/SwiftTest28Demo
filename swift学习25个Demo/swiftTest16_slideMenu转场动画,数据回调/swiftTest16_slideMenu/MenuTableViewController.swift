//
//  MenuTableViewController.swift
//  swiftTest16_slideMenu
//
//  Created by 李俊成 on 2018/5/17.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
@objc protocol MenuDelegate { // 代理1
    func MenuDelegateTest(backMsg:String)
}
class MenuTableViewController: UITableViewController {
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItem = "Everyday Moments"
    
    var delegate:MenuDelegate? // 代理2
    func processMethod(cmdStr:String) { // 代理3
        if ((delegate) != nil) {
            delegate?.MenuDelegateTest(backMsg: cmdStr)
        }
    }
    // 定义block1
    typealias fucBlock = (_ backMsg:String)->()
    // 创建block变量2
    var blcokpro : fucBlock!
    var blcokpro2 : fucBlock!
    func processMethodBlock(cmdStr:String) { // block 3
        if let _ = blcokpro {
           blcokpro(cmdStr)
        }
    }
    func processMethodBlock2(cmdStr:String,blcokpro2:fucBlock) { // block优化
            blcokpro2(cmdStr)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell

        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear

        return cell
    }
   
    override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.title = menuItems[indexPath.row]
        if let selectedRow = self.tableView.indexPathForSelectedRow?.row {
            currentItem = menuItems[selectedRow]
        }
//        self.processMethod(cmdStr: menuItems[indexPath.row]) // 代理4
//        self.processMethodBlock(cmdStr: menuItems[indexPath.row]) // 闭包 4
        self.processMethodBlock2(cmdStr: menuItems[indexPath.row], blcokpro2:blcokpro2)
        self.dismiss(animated: true, completion: nil)
    }
}
