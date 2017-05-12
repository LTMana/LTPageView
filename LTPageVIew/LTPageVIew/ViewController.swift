//
//  ViewController.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height-64)
        
        let titles = ["推荐","游戏","娱乐","趣玩","你好","测试","娱乐","趣玩","你好","测试","娱乐","趣玩","你好","测试","娱乐","趣玩","你好","测试"]
        
        var childvcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            
            vc.view.backgroundColor=UIColor.randomColor()
            
            childvcs.append(vc)
    
        }
        
        var style = LTPageStyle()
        style.isScrollEnable = true
        
        let pageVIew = LTPageView(frame: pageFrame, titles: titles, style: style, childVcs: childvcs, parentVc: self)
        
        view.addSubview(pageVIew)
        
    }

   }

