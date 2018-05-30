//
//  JCAlrtView.swift
//  swiftTest1
//
//  Created by 李俊成 on 2018/5/10.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
//  引用的方法
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    if #available(iOS 10.0, *) {
        return UIColor.init(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    } else {
       return UIColor.red
    }
}
class JCAlrtView: UIView {

     // 定义
    let green = RGB(r: 78, g: 229, b: 159)
    let red = RGB(r: 252, g: 100, b: 98)
    let gray = RGB(r: 106, g: 106, b: 106)
    
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    var falseBtn = UIButton()
    var trueBtn = UIButton()
    var cantenerView = UIView()
    // 闭包回调
    var resualtBlock = { (isTure:Bool) in}
    // 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        self.isHidden = true
        
        cantenerView.addSubview(contentLabel)
        cantenerView.addSubview(falseBtn)
        cantenerView.addSubview(trueBtn)
        self.addSubview(cantenerView)
        cantenerView.layer.cornerRadius = 6
        cantenerView.backgroundColor = UIColor.white
        trueBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        falseBtn.titleLabel?.font = trueBtn.titleLabel?.font
        falseBtn.setTitleColor(red, for: .normal)
        trueBtn.setTitleColor(green, for: .normal)
        
        contentLabel.textAlignment = .center
        contentLabel.numberOfLines = 0
        contentLabel.textColor = gray
        contentLabel.font = trueBtn.titleLabel?.font
        trueBtn.addTarget(self, action: #selector(choicePress), for: .touchUpInside)
        falseBtn.addTarget(self, action: #selector(choicePress), for: .touchUpInside)
        trueBtn.setTitle("是", for: .normal)
        falseBtn.setTitle("否", for: .normal)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // 外部 可以调用的方法
    func showChoice(str:String) {
        self.isHidden = false
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let newframe = CGRect.init(x: 0, y: 0, width: frame.size.width-32, height: resualtHight(str: str))
        cantenerView.frame = newframe
        cantenerView.center = self.center
        contentLabel.text = str
        makeViews() // 布局
        cantenerView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        showAnimate() //
        let windo = UIApplication.shared.keyWindow
        windo?.addSubview(self)
        
    }
    // 计算高度
    func resualtHight(str:String) -> CGFloat {
        let result:CGFloat = 44
        let str = NSString(string: str)
        let size = CGSize(width: frame.size.width-56, height: 700)
        let ri = str.boundingRect(with: size, options:NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)], context: nil)
        return result + max(ri.height, 60)
    }
    // private 内部的方法 动画
    private func showAnimate () {
        UIView.animate(withDuration: 0.25) {
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        }
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.cantenerView.center.y = self.cantenerView.center.y - self.cantenerView.frame.height
            self.cantenerView.transform = .identity
            
        }) { (b) in
            
        }
    }
    // private 内部的方法
    @objc private func choicePress(sender:UIButton) {
        resualtBlock((sender == trueBtn))
        if sender == trueBtn {
            
        }
        self.cantenerView.transform = .identity
        self.cantenerView.snp.removeConstraints()
        self.removeFromSuperview()
    }
   
    // 布局 mas
    private func makeViews(){
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cantenerView.snp.top)
            make.right.equalTo(cantenerView.snp.right).inset(12)
            make.left.equalTo(cantenerView.snp.left).inset(12)
            make.bottom.equalTo(falseBtn.snp.top).inset(0)
        }
        falseBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(cantenerView.snp.bottom)
            make.right.equalTo(cantenerView.snp.right)
            make.height.equalTo(44)
            make.width.equalTo(cantenerView.frame.width/2)
        }
        trueBtn.snp.makeConstraints { (make) in
            make.left.equalTo(cantenerView.snp.left)
            make.bottom.equalTo(cantenerView.snp.bottom)
            make.height.equalTo(44)
            make.width.equalTo(falseBtn.snp.width)
        }
    }
}


