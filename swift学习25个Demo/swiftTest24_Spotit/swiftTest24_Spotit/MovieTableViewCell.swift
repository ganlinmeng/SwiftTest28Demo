//
//  MovieTableViewCell.swift
//  swiftTest24_Spotit
//
//  Created by 李俊成 on 2018/5/21.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    var imageMovieImage = UIImageView()
    var lblTitle = UILabel()
    var lblDescription = UILabel()
    var lblRating = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpUI() {
        imageMovieImage.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageMovieImage.backgroundColor = UIColor.red
        lblRating.frame = CGRect(x: 0, y: 50, width: 50, height: 50)
        lblRating.backgroundColor = UIColor.yellow
        lblTitle.frame = CGRect(x: 50, y: 0, width: 50, height: 50)
        lblTitle.backgroundColor = UIColor.gray
        lblDescription.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        lblDescription.backgroundColor = UIColor.green
        lblRating.layer.cornerRadius = lblRating.frame.size.width / 2
        lblRating.layer.masksToBounds = true
        self.contentView.addSubview(imageMovieImage)
        self.contentView.addSubview(lblRating)
        self.contentView.addSubview(lblTitle)
        self.contentView.addSubview(lblDescription)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
