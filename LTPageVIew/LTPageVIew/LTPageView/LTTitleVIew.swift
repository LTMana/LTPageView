//
//  LTTitleVIew.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit

class LTTitleVIew: UIView {

    var titles:[String]
    var style: LTPageStyle
    fileprivate lazy var scrollView : UIScrollView = {
      
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    
    
    init(frame: CGRect,titles:[String],style:LTPageStyle){
        self.titles = titles
        self.style = style
        super.init(frame:frame)
        setupUI()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension LTTitleVIew{
    fileprivate func setupUI(){
        
        addSubview(scrollView)
        
        
        setupTitleLabels()
    }
    
    private func setupTitleLabels(){
        
        
        var titleLabels : [UILabel] = [UILabel]()
        for (i,title) in titles.enumerated(){
            
            let titleLabel = UILabel()
            
            
            titleLabel.text = title
            titleLabel.tag = i
            titleLabel.textAlignment = .center
    
            
            
            
            
            titleLabels.append(titleLabel)
        }
        
        
        
    }
}
