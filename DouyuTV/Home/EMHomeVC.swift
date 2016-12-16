//
//  EMHomeVC.swift
//  DouyuTV
//
//  Created by LIANG on 2016/11/28.
//  Copyright © 2016年 Emir. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class EMHomeVC: EMBaseVC {

    // MARK:- 懒加载
    fileprivate lazy var pageTitleView: EMPageTitleView = {[weak self] in
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = EMPageTitleView(frame: frame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    fileprivate lazy var pageContentView: EMPageContentView = {[weak self] in
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)

        var childVCs = [UIViewController]()
        childVCs.append(EMRecommandVC())
        childVCs.append(EMGameVC())
        childVCs.append(EMAmuseVC())
        childVCs.append(EMFunnyVC())
        
        let contentView = EMPageContentView(frame: contentFrame, childVCs: childVCs, parentViewController: self!)
        contentView.delegate = self
        return contentView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension EMHomeVC {
    
    fileprivate func setupUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        view.addSubview(pageTitleView)
        view.addSubview(pageContentView)
    }
    
    fileprivate func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)

        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

extension EMHomeVC: EMPageTitleViewDelegate {
    func pageTitleView(_ titleView: EMPageTitleView, seletedIndex: Int) {
        pageContentView.setCurrentIndex(seletedIndex)
    }
}

extension EMHomeVC: EMPageContentViewDelegate {
    func pageContenView(_ contentView: EMPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
