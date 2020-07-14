//
//  MainTabbarController.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 修改标签栏选中时文字颜色、字体
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor.orange
        creatChileControl(Vc: HomeMainViewController.init(), title: "首页", nomal: "UnAccount", selct: "SelAccount")
        creatChileControl(Vc: MyMainViewController.init(), title: "我的", nomal: "UnClicle", selct: "SelClicle")
    }
}

extension MainTabbarController {
    
    private func creatChileControl(Vc : UIViewController ,title:String ,nomal:String ,selct:String) {
       
     
         Vc.tabBarItem = UITabBarItem.init(title: title, image:UIImage.init(named: nomal), selectedImage: UIImage.init(named: selct))
       
        let nav = UINavigationController.init(rootViewController: Vc)
        
        addChild(nav)
        
    }

}

