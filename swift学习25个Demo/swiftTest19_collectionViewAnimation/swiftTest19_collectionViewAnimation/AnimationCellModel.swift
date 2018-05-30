//
//  AnimationCellModel.swift
//  swiftTest19_collectionViewAnimation
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    let iamgePath : String
    init(imagePath:String?) {
        self.iamgePath = imagePath ?? ""
    }
    
}
