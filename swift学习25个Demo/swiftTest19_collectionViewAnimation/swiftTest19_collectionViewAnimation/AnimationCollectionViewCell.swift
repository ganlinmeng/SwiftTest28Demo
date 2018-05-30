//
//  AnimationCollectionViewCell.swift
//  swiftTest19_collectionViewAnimation
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    // 控件定义
    var backBtutton = UIButton()
    var animationImageView = UIImageView()
    var animationTextView = UITextView()
    // 初始化
    override init(frame: CGRect) {
        super .init(frame: frame)
        backBtutton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        backBtutton.backgroundColor = UIColor.red
        backBtutton.setTitle("点我变回原来的样子", for: .normal)
        animationTextView.backgroundColor = UIColor.gray
        animationImageView.backgroundColor = UIColor.yellow
        animationImageView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        animationTextView.frame = CGRect(x: 0, y: UIScreen.main.bounds.width+50, width: UIScreen.main.bounds.width, height: 40)
        animationTextView.font = UIFont.systemFont(ofSize: 19)
        self.contentView .addSubview(backBtutton)
        self.contentView.addSubview(animationImageView)
        self.contentView.addSubview(animationTextView)
        self.contentView.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backBtnTapped :(() -> Void)?
    // 方法
    func prepareCell(viewModel: AnimationCellModel) { // 布局准备cell
        animationImageView.image = UIImage(named: viewModel.iamgePath)
        animationTextView.isScrollEnabled = false
        backBtutton.isHidden = true
        addtapEventHandler()
    }
    func handleCellSelected()  {
        animationTextView.isScrollEnabled = false
        backBtutton.isHidden = false
        self.superview?.bringSubview(toFront: self)
    }
    // 内部方法
    private func addtapEventHandler () {
        backBtutton.addTarget(self, action: #selector(backBtnDidTouch), for: .touchUpInside)
    }
   @objc func backBtnDidTouch(sender: UIGestureRecognizer)  {
        backBtnTapped?()
    }
    
    
}
