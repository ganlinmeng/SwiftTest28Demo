//
//  Statuses.swift
//  swiftTest26_网络请求
//
//  Created by 李俊成 on 2018/5/23.
//  Copyright © 2018年 李俊成. All rights reserved.
//
/*
 {
 "uts" : 1527031921625,
 "img" : "",
 "id" : "7ba2Qr6",
 "abs" : "",
 "rectime" : "05-23 07:32",
 "cmt" : 0,
 "st" : 0,
 "go" : 0,
 "title" : "富士康IPO价格定了！工业富联发行价13.77元",
 "feed_title" : "华尔街见闻",
 "time" : "05-23 00:37"
 }

 */
//   其实 <- 是一个泛型函数
/*
 public func <- <T>(inout left: T?, right: Map) {
 switch right.mappingType {
 case .FromJSON where right.isKeyPresent:
 FromJSON.optionalBasicType(&left, object: right.value())
 case .ToJSON:
 ToJSON.optionalBasicType(left, map: right)
 default: ()
 }
 }
 */
import UIKit
import ObjectMapper
class Statuses: Mappable {
    
    var uts : String? // 字符串可选
    var id :Int = 0 // 基本数据类型要赋初值
    var title : String?
    var feed_title : String?
    var time : String?
    var abs : String?
    
    required init?(map: Map) {

    }

    func mapping(map: Map) {
        uts <- map["uts"]
        id <- map["id"]
        title <- map["title"]
        feed_title <- map["feed_title"]
        time <- map["time"]
        abs <- map["abs"]
    }
}
class articlesObj: Mappable {
    var articles:[Statuses]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        articles <- map["articles"]
    }
}


