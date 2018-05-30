//
//  ViewController.swift
//  swiftTest20_swipeableCell
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController1: UITableViewController {
    var data = [
        pattern(image:"1",name:"Pattern Building1"),
        pattern(image:"2",name:"Pattern Building2"),
        pattern(image:"3",name:"Pattern Building3"),
        pattern(image:"4",name:"Pattern Building4"),
        pattern(image:"5",name:"Pattern Building5"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(patternCellTableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! patternCellTableViewCell
        let pattern = data[indexPath.row]
        cell.patternImageView.image = UIImage(named: pattern.image)
        cell.patternLabel.text = pattern.name
        cell.patternLabel.textColor = UIColor.red
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "delete") { (action, index) in
            print("delete Btn tapped")
        }
        delete.backgroundColor = UIColor.gray
        let share = UITableViewRowAction(style: .normal, title: "share") { (action, index) in
            print("share")
            let firstActivityItem = self.data[indexPath.row]
            let activ = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            self.present(activ, animated: true) { () -> Void in

                }
        }
        share.backgroundColor = UIColor.red
        
        let download = UITableViewRowAction(style: .normal, title: "download") { (action, index) in
            print("download")
        }
        download.backgroundColor = UIColor.blue
        return[download,share,delete]
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}



















































