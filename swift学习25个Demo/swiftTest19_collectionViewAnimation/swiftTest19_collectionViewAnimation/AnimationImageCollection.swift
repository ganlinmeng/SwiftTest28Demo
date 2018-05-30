//
//  AnimationImageCollection.swift
//  swiftTest19_collectionViewAnimation
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
struct aninationImageCollection {
    private let imagePaths = ["1", "2", "3", "4", "5"]
    var iamges = [AnimationCellModel]()
    init() {
        iamges = imagePaths.map{
            AnimationCellModel(imagePath: $0)
        }
    }
    
}
