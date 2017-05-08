//
//  LTContentView.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit

class LTContentView: UIView {
    var childVcs:[UIViewController]
    var parentVc:UIViewController
    
    init(frame: CGRect,childVcs:[UIViewController],parentVc:UIViewController){
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
