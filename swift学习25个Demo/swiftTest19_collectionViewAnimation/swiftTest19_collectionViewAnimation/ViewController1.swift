//
//  ViewController.swift
//  swiftTest19_collectionViewAnimation
//
//  Created by 李俊成 on 2018/5/18.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit
extension Array {
    func safeIndex(i: Int) ->Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}
class ViewController1: UICollectionViewController {
    // animation所需参数 struct使用场景
    private struct Constants {
        static let animationDuration: Double = 0.5
        static let animationDelay: Double = 0.0
        static let animationSpringDamping: CGFloat = 1.0
        static let animationInitialSPringVelocity: CGFloat = 1.0
    }
    var imageCollection : aninationImageCollection?
    var hightTag = CGFloat()
    
   init() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.width)
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI (){
    
        imageCollection = aninationImageCollection()
        self.collectionView?.register(AnimationCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /*
         guard let ,let
         else {
         
         }
         */
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? AnimationCollectionViewCell, let viewModel = imageCollection?.iamges.safeIndex(i: indexPath.row)
        else {
            return UICollectionViewCell()
        }
        cell.prepareCell(viewModel: viewModel) // 布局cell
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection?.iamges.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
            
            return
        }
        self.handleAnimationCellSelected(collectionView: collectionView, cell: cell)
    }
    private func handleAnimationCellSelected(collectionView:UICollectionView, cell:AnimationCollectionViewCell) {
        cell.handleCellSelected() // 显示按钮
        cell.backBtnTapped = self.backBtnDidTouch // 点击事件传递 666
        // 动画处理
        let animation:()->() = {
            cell.frame = CGRect(x: 0, y:self.hightTag + 64 , width: self.view.bounds.width, height: self.view.bounds.height)
        }
        let completion : (_ finished: Bool) -> () = {
            _ in
            collectionView.isScrollEnabled = false
        }
        UIView.animate(withDuration: Constants.animationDuration, delay: Constants.animationDelay, usingSpringWithDamping: Constants.animationSpringDamping, initialSpringVelocity: Constants.animationSpringDamping, options: [], animations: animation, completion: completion)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        hightTag = (self.collectionView?.contentOffset.y)!
    }
    // 单行刷新
    func backBtnDidTouch()  {
        guard let indexPaths = self.collectionView?.indexPathsForSelectedItems else {
            return
        }
        collectionView?.isScrollEnabled = true
        collectionView?.reloadItems(at: indexPaths)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}








































