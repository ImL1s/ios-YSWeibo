//
//  HomeViewController.swift
//  YSWeibo
//
//  Created by ImL1s on 2017/7/13.
//  Copyright © 2017年 ImL1s. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var titleBtn: TitleButton = TitleButton()
    lazy var popoverAnimator = PopoverAnimator()
    var popUpController: PopupViewController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigatorBar()
        vistorView.lanchAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}


// MARK: init function
extension HomeViewController{
    
    func initNavigatorBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "tabbar_profile")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "tabbar_compose_icon_add_highlighted")
        
        titleBtn.setTitle("Home", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick(btn:)), for: .touchUpInside)
        titleBtn.setTitleColor(UIColor.black, for: .normal)
        navigationItem.titleView = titleBtn
    }
    
}


// MARK: PopUpParentDelegate
extension HomeViewController: PopUpParentDelegate{
    func onDismiss() {
        titleBtn.isSelected = false
    }
}


// MARK: click event listener
extension HomeViewController{
    func titleBtnClick(btn: UIButton) {
        titleBtn.isSelected = !titleBtn.isSelected
        
        if(titleBtn.isSelected){
            if(popUpController != nil){
                popUpController?.dismiss(animated: true, completion: {
                    
                })
            }
            popUpController = PopupViewController()
            popUpController?.transitioningDelegate = self
            popUpController?.parentDelegate = self
            popUpController?.modalPresentationStyle = .custom
            
            present(popUpController!, animated: true) {
            }
        }else{
            popUpController?.dismiss(animated: true, completion: {
                
            })
        }
    }
}


// MARK: UIViewControllerTransitioningDelegate
extension HomeViewController: UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return UIHomePresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popoverAnimator.isPresented = true
        return popoverAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popoverAnimator.isPresented = false
        return popoverAnimator
    }
}



