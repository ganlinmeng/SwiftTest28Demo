//
//  ViewController.swift
//  swiftTest8_Refresh
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let cellIdentifer = "cellId"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    var emojiData = [String]()
    var tableviewController = UITableViewController(style: .plain)
    
    var refreshControl = UIRefreshControl()
    var navBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiData = favoriteEmoji
        let emojiTableView = tableviewController.tableView
        
        emojiTableView?.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView?.dataSource = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        tableviewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(didroadEmoji), for: .valueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
       
//        let number = NSNumber(integerLiteral: NSUnderlineStyle.styleSingle.rawValue)
//        let attributes = [NSUnderlineStyleAttributeName: number,NSForegroundColorAttributeName: UIColor.white]
//        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())",attributes:attributes)
        
        self.refreshControl.tintColor = UIColor.white
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())")
        
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView?.rowHeight = UITableViewAutomaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
    }
    // uitableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    @objc  func didroadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableviewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


























