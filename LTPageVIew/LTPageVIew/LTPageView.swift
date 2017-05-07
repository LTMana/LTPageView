//
//  LTPageView.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit

class LTPageView: UIView {

    var titles:[String]
    var style:LTPageStyle
    var childVcs:[UIViewController]
    var parentVc:UIViewController
    
    init(frame: CGRect,titles:[String],style:LTPageStyle,childVcs:[UIViewController],parentVc:UIViewController) {
        self.titles = titles
        self.style = style
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame:frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LTPageView{
    
    fileprivate func setupUI(){
        
        let TitleFrame = CGRect(x: 0, y: 0, width:bounds.width, height: style.titleHeight)
        let titleView = LTTitleVIew(frame: TitleFrame, titles: titles, style: style)
        titleView.backgroundColor = UIColor.blue
        addSubview(titleView)
        
        let contentFrame = CGRect(x: 0, y: TitleFrame.maxY, width: bounds.width, height: bounds.height-style.titleHeight)
        let contentView = LTContentView(frame: contentFrame, childVcs: childVcs, parentVc: parentVc)
        
        contentView.backgroundColor = .red
        addSubview(contentView)
        
        
        
        
        
    }
    
    
}
