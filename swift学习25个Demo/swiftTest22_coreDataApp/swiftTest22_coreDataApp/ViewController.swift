//
//  ViewController.swift
//  swiftTest22_coreDataApp
//
//  Created by 李俊成 on 2018/5/19.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UITableViewController {
    var listItems = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI () {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(rightClick))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    @objc func rightClick()  {
       addItem()
    }
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        do {
            let results = try managedContex.fetch(fetchRequest)
            listItems = results as! [NSManagedObject]
            self.tableView.reloadData()
        }catch {
            print("error")
        }
        
    }
    func addItem()  {
        // 弹窗
        let alertController = UIAlertController (title: "New Re", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction(title: "confirm", style: UIAlertActionStyle.default ,handler:({
        (_) in
            if let field = alertController.textFields![0] as? UITextField {
                self.saveItem(itemToSave: field.text!)
                self.tableView.reloadData()
            }
        }))
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addTextField( configurationHandler: {
            (textField) in
            textField.placeholder = "smothing"
        })
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func saveItem(itemToSave: String)  {
        let appdelegate =  UIApplication.shared.delegate as! AppDelegate
        let managedContex = appdelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContex)
        let item = NSManagedObject(entity: entity!, insertInto: managedContex)
        item.setValue(itemToSave, forKey: "item")
        do {
            try managedContex.save()
            listItems.append(item)
        }catch {
            print("error")
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let item = listItems[indexPath.row]
        cell.textLabel?.text = item.value(forKey: "item") as? String
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        return cell
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "delete") { (action, index) in
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContex = appdelegate.managedObjectContext
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
            managedContex.delete(self.listItems[indexPath.row])
            do {
                try managedContex.save()
                self.listItems.remove(at: indexPath.row)
                self.tableView.reloadData()
            }catch {
                print("error: delet")
            }
        }
        delete.backgroundColor = UIColor.red
        return [delete]
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




























































