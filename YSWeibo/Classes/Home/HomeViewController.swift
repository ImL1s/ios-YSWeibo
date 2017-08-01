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
    var popoverAnimator: PopoverAnimator? = nil
    var popUpController: PopupViewController? = nil
    let width: CGFloat = 180
    let height: CGFloat = 250
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
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
    
    func initAnimator() {
        popoverAnimator = PopoverAnimator{ (presented) in
            self.titleBtn.isSelected = presented
        }
        
        let x = (self.view!.frame.size.width * 0.5) - (width * 0.5) + 20
        popoverAnimator?.viewFrame = CGRect(x: x, y: 60, width: width, height: height)
    }
    
    func initNavigatorBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "tabbar_profile")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "tabbar_compose_icon_add_highlighted")
        
        titleBtn.setTitle("Home", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick(btn:)), for: .touchUpInside)
        titleBtn.setTitleColor(UIColor.black, for: .normal)
        navigationItem.titleView = titleBtn
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
            popUpController?.transitioningDelegate = popoverAnimator
            popUpController?.modalPresentationStyle = .custom
            
            present(popUpController!, animated: true) {
            }
        }else{
            popUpController?.dismiss(animated: true, completion: {
                
            })
        }
    }
}



