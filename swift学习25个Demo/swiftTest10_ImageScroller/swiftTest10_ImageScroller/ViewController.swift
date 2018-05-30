//
//  ViewController.swift
//  swiftTest10_ImageScroller
//
//  Created by 李俊成 on 2018/5/15.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var scrollView = UIScrollView()
    var imageView = UIImageView()
//    var imageViewTopConstraint : NSLayoutConstraint!
//    var imageViewTrailingConstraint : NSLayoutConstraint!
//    var imageViewBottomConstraint : NSLayoutConstraint!
//    var imageViewLeadingConstraint : NSLayoutConstraint!
    var imageViewTopConstraint = NSLayoutConstraint()
    var imageViewTrailingConstraint = NSLayoutConstraint()
    var imageViewBottomConstraint = NSLayoutConstraint()
    var imageViewLeadingConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        scrollView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    func setUpUI() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        imageView.image = UIImage(named: "steve")
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    //计算scrollView的缩放比例，缩放比例为1表示内容以正常大小显示；缩放比例小于1表示容器内的内容缩小，缩放比例大于1表示放大容器内的内容

    fileprivate func updateMinZoomScaleForSize(_ size:CGSize) {
         //要获得最小的缩放比例，首先计算所需的缩放比例，以便根据其宽度在scrollView中紧贴imageView
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        //选取宽度和高度比例中最小的那个,设置为minimumZoomScale
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
        
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView)  {
        updateConstreaintsForSize(view.bounds.size)
    }
    // //当scrollView的内容大小小于边界时，内容将放置在左上角而不是中心，updateConstraintForSize方法处理这个问题；通过调整图像视图的布局约束。
    fileprivate func updateConstreaintsForSize(_ size: CGSize) {
        let yOffset = max(0, (size.height - imageView.frame.height)/2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width)/2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        view.layoutIfNeeded()
        
        
    }
    //每次控制器更新其子视图时，更新最小缩放比例

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //当手势动作发生时，scrollView告诉控制器要放大或缩小子视图imageView

        return imageView
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}






















































