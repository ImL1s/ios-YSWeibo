//
//  PopoverAnimator.swift
//  YSWeibo
//
//  Created by R-PC006 on 2017/7/27.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {

    var isPresented: Bool = true

}

// MARK: UIViewControllerAnimatedTransitioning
extension PopoverAnimator: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        isPresented ? animationForPresentingView(transitionContext: transitionContext) : animationForDismissView(transitionContext: transitionContext)
    }
    
    func animationForPresentingView(transitionContext: UIViewControllerContextTransitioning){
        
        let presentingView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        transitionContext.containerView.addSubview(presentingView!)
        
        presentingView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentingView?.transform = CGAffineTransform.identity
        })
        { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    func animationForDismissView(transitionContext: UIViewControllerContextTransitioning){
        
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        transitionContext.containerView.addSubview(dismissView!)
        
        //        dismissView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView?.transform = CGAffineTransform(scaleX: 1, y: 0.001)
        })
        { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
