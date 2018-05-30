//
//  ViewController.swift
//  swiftTest4
//
//  Created by 李俊成 on 2018/5/11.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct video1 {
    let image : String
    let title : String
    let source : String
}
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var videoTableView = UITableView()
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    var palyViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        videoTableView.dataSource = self
        videoTableView.delegate = self
        videoTableView.frame = view.bounds
        videoTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(videoTableView)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! VideoTableViewCell
        let video = data[indexPath.row]
        cell.videoScreenshot.image = UIImage.init(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer.init(url: URL.init(fileURLWithPath: path!))
        palyViewController.player = playerView
        self.present(palyViewController, animated: true) {
            self.palyViewController.player?.play()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



























