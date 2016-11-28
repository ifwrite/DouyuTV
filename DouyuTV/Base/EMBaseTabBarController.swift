//
//  EMBaseTabBarController.swift
//  DouyuTV
//
//  Created by LIANG on 2016/11/28.
//  Copyright © 2016年 Emir. All rights reserved.
//

import UIKit

class EMBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = UIColor.orange
        
        setupControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:- 设置VCs
    private func setupControllers() {
        
        let homeNV = setTabbar(vc: EMHomeVC(), image: "btn_home_normal", selectedImage: "btn_home_selected", title: "首页")
        let liveNV = setTabbar(vc: EMLiveVC(), image: "btn_column_normal", selectedImage: "btn_column_selected", title: "直播")
        let videoNV = setTabbar(vc: EMVideoVC(), image: "btn_live_normal", selectedImage: "btn_live_selected", title: "视频")
        let followNV = setTabbar(vc: EMFollowVC(), image: "btn_live_normal", selectedImage: "btn_live_selected", title: "关注")
        let mineNV = setTabbar(vc: EMMineVC(), image: "btn_user_normal", selectedImage: "btn_user_selected", title: "我的")

        viewControllers = [homeNV, liveNV, videoNV, followNV, mineNV]
    }
    
    // MARK:- 设置tabar图片
    private func setTabbar(vc: EMBaseVC, image: String, selectedImage: String, title: String) -> EMBaseNV {
        let nv = EMBaseNV(rootViewController: vc)
        nv.tabBarItem.image = UIImage.init(named: image)
        nv.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        nv.tabBarItem.title = title
        
        return nv
    }
    
}
