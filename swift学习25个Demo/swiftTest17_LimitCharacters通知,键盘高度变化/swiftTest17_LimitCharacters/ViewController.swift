//
//  ViewController.swift
//  swiftTest17_LimitCharacters
//
//  Created by 李俊成 on 2018/5/17.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate{
    var tweetTextView = UITextView()
    var bottomUiview = UIView()
    var avatarIamgeView = UIImageView()
    var characterCountLabel = UILabel()
    var camerabtn = UIButton()
    var searchbtn = UIButton()
    var savebtn = UIButton()
    var shearbtn = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI () {
        
        let leftbtn = UIBarButtonItem(title: "close", style: .plain, target: self, action: #selector(closeClick))
        leftbtn.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = leftbtn
        let rightBtn = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: #selector(TweetClick))
        rightBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = rightBtn
        
        avatarIamgeView.frame = CGRect(x: 10, y: 70, width: 50, height: 50)
        avatarIamgeView.backgroundColor = UIColor.red
        avatarIamgeView.image = UIImage(named: "emojiself avatar")
        view.addSubview(avatarIamgeView)
        
        tweetTextView.frame = CGRect(x: 80, y: 70, width: 300, height: 300)
        tweetTextView.backgroundColor = UIColor.gray
        tweetTextView.font = UIFont.systemFont(ofSize: 19)
        view.addSubview(tweetTextView)
        
        bottomUiview.frame = CGRect(x: 0, y: self.view.bounds.height - 100, width: self.view.bounds.width, height: 100)
        bottomUiview.backgroundColor = UIColor.red
        view.addSubview(bottomUiview)
        
        camerabtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        camerabtn.setImage(#imageLiteral(resourceName: "Camera.pdf"), for:.normal)
        bottomUiview.addSubview(camerabtn)
        searchbtn.frame = CGRect(x: 60, y: 0, width: 50, height: 50)
        searchbtn.setImage(#imageLiteral(resourceName: "Search.pdf"), for: .normal)
        bottomUiview.addSubview(searchbtn)
        savebtn.frame = CGRect(x: 120, y: 0, width: 50, height: 50)
        savebtn.setImage(#imageLiteral(resourceName: "Paper.pdf"), for: .normal)
        bottomUiview.addSubview(savebtn)
        shearbtn.frame = CGRect(x: 180, y: 0, width: 50, height: 50)
        shearbtn.setImage(#imageLiteral(resourceName: "GPS.pdf"), for: .normal)
        bottomUiview.addSubview(shearbtn)
        
        characterCountLabel.frame = CGRect(x: self.view.bounds.width - 100, y: 0, width: 100, height: 50)
        bottomUiview.addSubview(characterCountLabel)
        view.backgroundColor = UIColor.white
        
        tweetTextView.delegate = self
        avatarIamgeView.layer.cornerRadius = avatarIamgeView.frame.width/2
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillHide(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let myTextViewString = tweetTextView.text
        characterCountLabel.text = "\(140-(myTextViewString?.characters.count)!)"
        if range.length > 140 {
            return false
        }
        let newLength = (myTextViewString?.characters.count)! + range.length
        return newLength < 140
    }
    @objc func keyBoardWillShow(note: NSNotification)  {
        let userInfo = note.userInfo
        let keyBoardBounds = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltay = keyBoardBounds.size.height
        let animations:(() -> Void) = {
            self.bottomUiview.transform = CGAffineTransform(translationX: 0,y: -deltay)
            
        }
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        }else {
            animations()
        }
    }
    @objc func keyBoardWillHide(note: NSNotification)  {
        let userInfo = note.userInfo
        let duration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations:(() -> Void) = {
            self.bottomUiview.transform = CGAffineTransform.identity
        }
        if duration > 0 {
            let options = UIViewAnimationOptions(rawValue: UInt((userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        }else {
            animations()
        }
        
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @objc func closeClick() {
        print("close")
    }
    @objc func TweetClick() {
        print("tweet")
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
































































