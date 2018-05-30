//
//  ViewController.swift
//  swiftTest_emojiSlotMachine
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource {
   
    var imageArr = [String]()
    var dataArr = [Int]()
    var dataArr2 = [Int]()
    var dataArr3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    var emojiPickerView = UIPickerView()
    var goBtn = UIButton()
    var resultlabel = UILabel()
    
   @objc func goBtnClick(_ sender: AnyObject) {
        emojiPickerView.selectRow(Int(arc4random()%90 + 3), inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()%90 + 3), inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()%90 + 3), inComponent: 2, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bounds = goBtn.bounds
        imageArr = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0...100 {
            self.dataArr.append((Int)(arc4random() % 10 ))
            self.dataArr2.append((Int)(arc4random() % 10))
            self.dataArr3.append((Int)(arc4random() % 10))
        }
        resultlabel.text = ""
        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        goBtn.layer.cornerRadius = 6
        
    }
    func setUpUI()  {
        emojiPickerView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        emojiPickerView.backgroundColor = UIColor.gray
        
        goBtn.frame = CGRect(x: 0, y: 450, width: 100, height: 50)
        goBtn.backgroundColor = UIColor.red
        goBtn.addTarget(self, action: #selector(goBtnClick), for: .touchUpInside)
        
        resultlabel.frame = CGRect(x: 0, y: 550, width: 100, height: 50)
        resultlabel.backgroundColor = UIColor .yellow
        
        view.addSubview(emojiPickerView)
        view.addSubview(goBtn)
        view.addSubview(resultlabel)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArr.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickLabel = UILabel()
        if component == 0 {
            pickLabel.text = imageArr[(Int)(dataArr[row])]
        }else if component == 1 {
            pickLabel.text = imageArr[(Int)(dataArr2[row])]
            
        }else {
            pickLabel.text = imageArr[(Int)(dataArr3[row])]
            
        }
        pickLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickLabel.textAlignment = NSTextAlignment.center
        return pickLabel
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.goBtn.alpha = 1
        }, completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

































































