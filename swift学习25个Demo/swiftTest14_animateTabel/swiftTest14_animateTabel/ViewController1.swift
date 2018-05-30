//
//  ViewController.swift
//  swiftTest14_animateTabel
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController1: UITableViewController {
   
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        self.view.backgroundColor = UIColor.blue
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "tableCell")
        self.title = "导航"
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func animateTable()  {
       
        self.tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight :  CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell : UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for a in cells {
            let cell : UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir", size: 15)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
        
    }
    func colorForIndex(_ index: Int) -> UIColor {
        let itemcount = tableData.count - 1
        let color = (CGFloat(index)/CGFloat(itemcount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "ShowAnimateTableViewController", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







































