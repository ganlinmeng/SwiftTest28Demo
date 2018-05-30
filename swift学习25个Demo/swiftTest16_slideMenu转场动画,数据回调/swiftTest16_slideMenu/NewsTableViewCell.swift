//
//  NewsTableViewCell.swift
//  swiftTest16_slideMenu
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var postImageView = UIImageView()
    var postTitle = UILabel()
    var postAuthor = UILabel()
    var authorImageVIew = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        
    }
    
    func setUpUI()  {
      
        postImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        postImageView.backgroundColor = UIColor.red
        self.contentView.addSubview(postImageView)
        postTitle.frame = CGRect(x: 0, y: 60, width: 200, height: 50)
        postTitle.backgroundColor = UIColor.blue
        self.contentView.addSubview(postTitle)
        postAuthor.frame = CGRect(x: 0, y: 120, width: 200, height: 50)
        postAuthor.backgroundColor = UIColor.gray
        self.contentView.addSubview(postAuthor)
        authorImageVIew.frame = CGRect(x: 0, y: 180, width: 100, height: 50)
        authorImageVIew.backgroundColor = UIColor.yellow
        self.contentView.addSubview(authorImageVIew)
        authorImageVIew.layer.cornerRadius = 10
        authorImageVIew.layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}














































