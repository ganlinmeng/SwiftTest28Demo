//
//  ViewController.swift
//  swiftTest26_网络请求
//
//  Created by 李俊成 on 2018/5/23.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
// NSURLConnection 通过http协议做网络请求
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        test1()
//        test2()
//        test3()
//        test4()
        test5()
//        test6()
    }
    // 利用NSURLConnection做(GET)网络请求
    /*
     1 确定请求路径
     2 创建请求对象
     3 发出请求
     */
    func test1() {
        // 1 创建请求路径
        let url = NSURL (string: "http://ikapp.ikang.com/appService/market/mainEvent")
        // 2 根据请求路径创建请求对象(GET)
        let request = NSURLRequest(url: url as! URL)
        // 3 发送请求
        /*
         
         
         */
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue()) { (response, data, error) in
            print(request)
            print(response)
            print(data)
            print(error)
            let dic = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dic)
        }
        
    }
    // 利用NSURLSession做(GET)网络请求
    //使用NSURLSession做网络请求
    //1.NSURL(请求路径)
    //2.NSURLRequest(请求对象)
    
    //3.NSURLSessionConfiguration(会话模式)
    //DefaultSessionConfiguration(默认会话)一般iOS开发就用这一个
    //ephemeralSessionConfiguration(瞬时会话模式)
    //backgroundSessionConfiguration(后台会话模式)
    
    //4.NSURLSessionTask(任务)
    //NSURLSessionDataTask -> 一般做数据请求任务(从服务器获取一般的数据网络请求)
    //NSURLSessionDownloadTask -> 下载任务(下载文件)
    //NSURLSessionUploadTask -> 上传任务(上传文件)
    
    //5.NSURLSession：同来封装http协议中固定的数据
    
    func test2()  {
        //1.创建请求路径
        let path = "http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json"
        //拼接参数(GET请求参数需要以"?"连接拼接到请求地址的后面，多个参数用"&"隔开，参数形式：参数名=参数值)
        //size:请求数据的长度
        let path2 = path + "?cid=0&size=30"
        //转换成url(统一资源定位符)
        let url = NSURL(string: path2)
        // 2 创建请求对象
        // NSURLRequest 类型的请求对象的请求方式一定是GET(默认GET 且不能被改变)
        let request = NSURLRequest(url: url as! URL)
        // 3 根据会话模式创建session
        // 创建默认会话模式session
        let session = URLSession.shared
        // 4 创建任务
        //参数1：需要发送的请求对象
        //参数2：服务返回数据的时候需要执行的对应的闭包
        //闭包参数1：服务器返回给客户端的数据
        //闭包参数2：服务器响应信息
        //闭包参数3：错误信息
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            // 当前这个闭包是在子线程中执行的, 更新UI回主线程
            print(response)
            print("能接收到")
            if data != nil {
                let dic = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(dic)
            }else {
                print("失败")
            }
        }
        // 5 开始执行任务
        task.resume()
    }
    // 利用NSURLSession做(POST)网络请求
    func test3()  {
        // 1 创建请求地址
        let url = NSURL(string:  "http://0.0.0.0:tuicool@api.tuicool.com/api/signup/register_by_email.json")
        // 2 创建请求对象
        // Post请求的请求对象必须使用nsmutableURLRequest创建 因为使用NSURLRequest不能更改请求方式, 但是nsMutableURLRequest 可以
        let request = NSMutableURLRequest(url:  url as! URL)
        request.httpMethod = "POST"
        // 设置请求体
        let  sendStr =  "email=10165910@163.com&name=鱼摆摆&password=123456789"
        // 将字符串转换成二进制
        let sendData = sendStr.data(using: String.Encoding.utf8)
        request.httpBody = sendData
        // 3 创建session
        let session = URLSession.shared
        print("请求成功")
        // 4 创建任务
        let task =  session.dataTask(with: request as URLRequest) { (data, response, error) in
            if data != nil {
                let dic = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(dic)
            }else {
                print("请求失败")
            }
        }
        task.resume()
    }
    // 三方引用可以参考 https://www.jianshu.com/p/4723da7eab66
    func test4()  {

        Alamofire.request("http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json", method: .get, parameters: ["cid":0,"size":30], encoding:URLEncoding.default, headers: nil).responseJSON { (data) in
            
            print(data)
           
            if data.result.isSuccess {
                 print("请求成功---Alamofire")
            }
            
        }
    }
    func test6()  {
        Alamofire.request("http://0.0.0.0:tuicool@api.tuicool.com/api/signup/register_by_email.json", method: .post, parameters: ["email":"101659109@qq.com","name":"鱼摆摆","password":"123456789"], encoding:URLEncoding.default, headers: nil).responseJSON { (data) in
            
            print(data)
            if data.result.isSuccess {
                print("请求成功3---Alamofire")
            }
            
            
        }
    }
    func test5()  {
        Alamofire.request("http://0.0.0.0:tuicool@api.tuicool.com/api/articles/hot.json").responseJSON { (data) in
            print(data)
            if data.result.isSuccess {
                print("请求成功2---Alamofire")
            }
            let json = JSON(data.data)
            print("jsonData--\(json)")
            // 数组访问
            let student: Array? = json["articles"].array
            let studentid = student![0]["id"].string
            print("jsonData数组访问--\(studentid)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
















































