//
//  UIBarButtonItem-Extension.swift
//  DouyuTV
//
//  Created by LIANG on 2016/11/29.
//  Copyright © 2016年 Emir. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    convenience init(imageName: String, highImageName: String = "", size: CGSize = .zero) {
        
        let btn = UIButton()
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage.init(named: highImageName), for: .highlighted)
        }
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
