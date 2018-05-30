//
//  MenuTransitionManager.swift
//  swiftTest16_slideMenu
//
//  Created by 李俊成 on 2018/5/16.
//  Copyright © 2018年 李俊成. All rights reserved.
//
// 自定义转场动画管理类
import UIKit
@objc protocol MenuTransitionManagerDelegate {
    func dismiss()
}
class MenuTransitionManager: NSObject ,UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate{
    
    var duration = 0.5 // 时间
    var isPresenting = false // 标记是否弹出
    var delegate:MenuTransitionManagerDelegate? // 代理
    // 快照
    var snapshot : UIView? {
        didSet {
            if let _delegate = delegate {
                let tapGestureRecognizer = UITapGestureRecognizer(target: _delegate, action: "dismiss")
                snapshot?.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform(translationX: 0, y: container.frame.height - 150)
        let moveUp = CGAffineTransform(translationX: 0,y: -50)
        
        if isPresenting {
            toView?.transform = moveUp
            snapshot = fromView.snapshotView(afterScreenUpdates: false)
            container.addSubview(toView!)
            container.addSubview(snapshot!)
        }
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            if self.isPresenting {
                self.snapshot?.transform = moveDown
                toView?.transform = CGAffineTransform.identity
                
            }else {
                self.snapshot?.transform = CGAffineTransform.identity
                fromView.transform = moveUp
            }
        }, completion: { finished in
                transitionContext.completeTransition(true)
                if !self.isPresenting {
                    self.snapshot?.removeFromSuperview()
                }
        })
        
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
}










































