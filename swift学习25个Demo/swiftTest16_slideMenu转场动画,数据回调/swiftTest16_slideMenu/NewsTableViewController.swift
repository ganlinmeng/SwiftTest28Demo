//
//  NewsTableViewController.swift
//  swiftTest16_slideMenu
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController,MenuTransitionManagerDelegate,MenuDelegate { // 代理 7
    
    func MenuDelegateTest(backMsg: String) { // 代理5
        print(backMsg)
        self.title = backMsg
    }
    
    let menuTransitionManager = MenuTransitionManager()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.title = "everday moments"
        self.view.backgroundColor = UIColor.white
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    func setUpUI()  {
        let leftBtn = UIBarButtonItem(title: "选择", style: .plain, target: self, action: #selector(unWindToHome))
        self.navigationItem.leftBarButtonItem = leftBtn
        self.tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func dismiss()  {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0 {
            cell.postImageView.image = UIImage(named: "1")
            cell.postTitle.text = "Love you"
            cell.postAuthor.text = "lijuncheng"
            cell.authorImageVIew.image = UIImage(named: "a")
        }else if indexPath.row == 1 {
            cell.postImageView.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "Cole"
            cell.authorImageVIew.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.postImageView.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Daniel Hooper"
            cell.authorImageVIew.image = UIImage(named: "c")
            
        } else {
            cell.postImageView.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Noby-Wan Kenobi"
            cell.authorImageVIew.image = UIImage(named: "d")
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        return cell
    }
    @objc func unWindToHome () {
        
        let menuVC =  MenuTableViewController()
        menuVC.currentItem = self.title!
        menuVC.transitioningDelegate = menuTransitionManager // 转场
        menuTransitionManager.delegate = self
        menuVC.delegate = self // 代理6
        menuVC.blcokpro = {(backMsg) in
            print(backMsg)
        }
        menuVC.blcokpro2 = {(backMsg) in
            print(backMsg)
        }
        self.present(menuVC, animated: true, completion: nil)
        
    }
}
