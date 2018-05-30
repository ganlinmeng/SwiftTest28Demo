//
//  VideoTableViewCell.swift
//  swiftTest4
//
//  Created by 李俊成 on 2018/5/11.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

struct video {
    let image : String
    let title : String
    let source : String
}

class VideoTableViewCell: UITableViewCell {

    var videoScreenshot =  UIImageView()
    var videoTitleLabel =  UILabel()
    var videoSourceLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI() {
        videoScreenshot.frame = CGRect.init(x: 0, y: 0, width: 200, height: 100)
        videoScreenshot.backgroundColor = UIColor.red
        self.contentView.addSubview(videoScreenshot)
        videoTitleLabel.frame = CGRect.init(x: 0, y: 150, width: 200, height: 30)
        videoTitleLabel.backgroundColor = UIColor.yellow
        self.contentView.addSubview(videoTitleLabel)
        videoSourceLabel.frame = CGRect.init(x: 0, y: 180, width: 200, height: 30)
        videoSourceLabel.backgroundColor = UIColor.blue
        self.contentView.addSubview(videoSourceLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
