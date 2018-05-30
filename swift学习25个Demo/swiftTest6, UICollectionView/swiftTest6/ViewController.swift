//
//  ViewController.swift
//  swiftTest6
//
//  Created by 李俊成 on 2018/5/14.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var backgroundImageView =  UIImageView()
    var collectionView : UICollectionView!
    
    var currentUserProfileImageButton = UIButton()
    var currentUserFullNameButton = UIButton()
    
    fileprivate var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setUpUI() {
        backgroundImageView.frame = view.bounds
        backgroundImageView.image = UIImage(named: "blue")
        view.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        
        let effect = UIBlurEffect.init(style: .light)
        let effectView = UIVisualEffectView.init(effect: effect)
        effectView.frame = view.bounds
        backgroundImageView.addSubview(effectView) // 毛玻璃效果
       
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: view.frame.width, height: view.frame.width)
        layout.minimumLineSpacing = 0 // 间距
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)

         self.collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.width), collectionViewLayout:layout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(InterestCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
    }

}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! InterestCollectionViewCell
        cell.interest = self.interests[indexPath.item]
        return cell
    }
}




























