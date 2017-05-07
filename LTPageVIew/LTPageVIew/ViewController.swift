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
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height-64)
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        var childvcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            
            vc.view.backgroundColor=UIColor(red:CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha:1.0)
            
            childvcs.append(vc)
    
        }
        
        let style = LTPageStyle()
        
        let pageVIew = LTPageView(frame: pageFrame, titles: titles, style: style, childVcs: childvcs, parentVc: self)
        
        view.addSubview(pageVIew)
        
    }

   }

