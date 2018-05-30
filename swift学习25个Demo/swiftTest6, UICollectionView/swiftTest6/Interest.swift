//
//  Interest.swift
//  swiftTest6
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class Interest {
   
    var title = ""
    var description = ""
    var numbeerOfMembers = 0
    var numberOfPosts = 0
    var featuredImage :UIImage!
    
    init(title: String, description: String ,featuredImage: UIImage) {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfPosts = 1
        numbeerOfMembers = 1
    }
    
    static func createInterests()-> [Interest] {
        return [
            Interest(title: "sdsds", description: "adsasda", featuredImage: UIImage(named: "hello")!),
            Interest(title: "sdsds2", description: "adsasda2", featuredImage: UIImage(named: "bodyline")!),
            Interest(title: "sdsds3", description: "adsasda3", featuredImage: UIImage(named: "wave")!),
            Interest(title: "sdsds4", description: "adsasda4", featuredImage: UIImage(named: "darkvarder")!),
            Interest(title: "sdsds5", description: "adsasda5", featuredImage: UIImage(named: "hhhhh")!)
        ]
    }
    
    
    
    
}
