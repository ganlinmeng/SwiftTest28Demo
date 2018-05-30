//
//  InterestCollectionViewCell.swift
//  swiftTest6
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
  
    var featuredImageView = UIImageView()
    var interesrtTitleLable = UILabel()
    
    
    // 属性改变之前触发willSet方法，属性改变之后触发didSet方法
    var interest:Interest! {
        didSet{
            updateUI()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        featuredImageView.frame = CGRect(x: 10, y: 0, width: self.contentView.frame.width - 20, height:  self.contentView.frame.height - 100)
        featuredImageView.backgroundColor = UIColor.blue
        featuredImageView.layer.cornerRadius = 5.0
        featuredImageView.clipsToBounds = true
        
        interesrtTitleLable.frame = CGRect(x: 10, y:self.contentView.frame.height - 100, width: self.contentView.frame.width - 20, height: 100)
        interesrtTitleLable.backgroundColor = UIColor.gray
        self.contentView.addSubview(featuredImageView)
        
        self.contentView.addSubview(interesrtTitleLable)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func updateUI () {
        interesrtTitleLable.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
