//
//  ViewController.swift
//  SwiftTest18_PullRefresh
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tablView = UITableView()
    var refreshController = UIRefreshControl()
    var customView = UIView()
    var labelsArray : Array<UILabel> = []
    var isAnimating = false
    var currentLabelIndex = 0
    var currentColorIndex = 0
    var timer :  Timer!
    var dataArray : Array<String> = ["😂", "🤗", "😳", "😌", "😊"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        tablView.delegate = self
        tablView.dataSource = self
        refreshController = UIRefreshControl()
        refreshController.backgroundColor = UIColor.clear
        refreshController.tintColor = UIColor.clear
        tablView.addSubview(refreshController)
        
        let  refreshContents = UIView()
        refreshContents.frame  = CGRect(x: 10, y: 0, width: self.view.bounds.width, height: 50)
        let label1 = UILabel()
        label1.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        label1.text = "refresh"
        label1.tag = 1;
        label1.textColor = UIColor.black
        refreshContents.addSubview(label1)
        
        let label2 = UILabel()
        label2.frame = CGRect(x: 110, y: 0, width: 50, height: 50)
        label2.text = "refresh"
        label2.tag = 2;
        label2.textColor = UIColor.black
        refreshContents.addSubview(label2)
  
        labelsArray.append(label1)
        labelsArray.append(label2)
       
        refreshController.addSubview(refreshContents)
        
    }
    func setUpUI()  {
        tablView.frame = CGRect(x: 0, y: 100, width: 300, height: 500)
        tablView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tablView)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
//    func loadCustomRefreshContentds()  {
//        let refreshContents = Bundle.main.loadNibNamed("RefreshContents",owner:self ,options:nil)
//        customView = refreshContents![0] as! UIView
//        customView.frame = refreshController.bounds
//        for i in 0..<customView.subviews.count {
//            labelsArray.append(customView.viewWithTag(i+1) as! UILabel)
//        }
//        refreshController.addSubview(customView)
//    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            if !isAnimating {
                doSomething()
                animateRefreshStep1()
            }
        }
    }
    func animateRefreshStep1() {
        isAnimating = true
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            () -> Void
            in
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
        } , completion: { (finished) -> Void in
            UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                () -> Void in
                self.labelsArray[self.currentColorIndex].transform = CGAffineTransform.identity
                self.labelsArray[self.currentColorIndex].textColor = UIColor.black
                
            }, completion: { (finished)-> Void in
                self.currentColorIndex += 1
                if self.currentColorIndex < self.labelsArray.count {
                    self.animateRefreshStep1()
                }else {
                     self.animateRefreshStep2()
                }
            })
        })
    }
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            () -> Void in
            self.labelsArray[0].transform =  CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
   
        }, completion: {
            (finished) -> Void in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                ()-> Void in
                self.labelsArray[0].transform = CGAffineTransform.identity
                self.labelsArray[1].transform = CGAffineTransform.identity

            }, completion: { (finished) -> Void in
                if self.refreshController.isRefreshing {
                    self.currentLabelIndex = 0
                    self.animateRefreshStep1()
                }
                else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    for i in 0 ..< self.labelsArray.count {
                        self.labelsArray[i].textColor = UIColor.black
                        self.labelsArray[i].transform = CGAffineTransform.identity
                    }
                }
            })
        })
    }
    func getNextColor() ->UIColor {
//        var colorsArray : Array<UIColor> = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange ]
        var colorsArray : Array<UIColor> = [UIColor.magenta, UIColor.brown]
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        
        return returnColor
        
    }
    
    func doSomething()  {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(endedOfWork), userInfo: nil, repeats: true)
    }
   @objc func endedOfWork()  {
        refreshController.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
















































