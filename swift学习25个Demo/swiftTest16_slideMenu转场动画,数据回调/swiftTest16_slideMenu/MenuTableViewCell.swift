//
//  MenuTableViewCell.swift
//  swiftTest16_slideMenu
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var titleLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpUI()  {
        titleLabel.frame = CGRect(x: 0, y: 10, width: 300, height: 40)
        titleLabel.backgroundColor = UIColor.red
        self.contentView.addSubview(titleLabel)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
