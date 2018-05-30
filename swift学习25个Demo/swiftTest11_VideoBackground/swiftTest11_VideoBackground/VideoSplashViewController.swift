//
//  VideoSplashViewController.swift
//  swiftTest11_VideoBackground
//
//  Created by 李俊成 on 2018/5/15.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit
//AVLayerVideoGravityResize,       // 非均匀模式。两个维度完全填充至整个视图区域
//AVLayerVideoGravityResizeAspect,  // 等比例填充，直到一个维度到达区域边界
//AVLayerVideoGravityResizeAspectFill, // 等比例填充，直到填充满整个视图区域，其中一个维度的部分区域会被裁剪
public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}
class VideoSplashViewController: UIViewController {

    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    open var contentURL:URL? {
        didSet {
            if let _contenURL = contentURL {
                setMoviePlayer(_contenURL)
            }
        }
    }
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor:UIColor = UIColor.black{
        didSet{
            view.backgroundColor = backgroundColor
        }
    }
    open var sound:Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    open var alpha :CGFloat = CGFloat() {
        didSet{
            moviePlayer.view.alpha = alpha
        }
    }
    open var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(VideoSplashViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    open var fillMode :ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .resizeAspect :
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case.resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }
    override open func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    fileprivate func setMoviePlayer(_ url:URL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error)-> Void in
            if let path = videoPath as URL? {
                self.moviePlayer.player = AVPlayer(url: path)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    @objc func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





















































