//
//  patternCellTableViewCell.swift
//  swiftTest20_swipeableCell
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
// 相当于model的作用
struct pattern {
    let image : String
    let name : String
}
class patternCellTableViewCell: UITableViewCell {
    var patternLabel = UILabel()
    var patternImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    func setUpUI()  {
        patternLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        self.contentView .addSubview(patternLabel)
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
