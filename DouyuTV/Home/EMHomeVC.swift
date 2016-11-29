//
//  EMHomeVC.swift
//  DouyuTV
//
//  Created by LIANG on 2016/11/28.
//  Copyright © 2016年 Emir. All rights reserved.
//

import UIKit

class EMHomeVC: EMBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "logo"), style: .plain, target: self, action: #selector(leftAction))
    }
    
    func leftAction() {

    }
}
