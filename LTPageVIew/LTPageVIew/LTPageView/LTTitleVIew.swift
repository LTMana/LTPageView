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
            titleLabel.textColor = i==0 ? style.selectColor : style.normalColor
            titleLabel.font = style.titleFont
            titleLabel.isUserInteractionEnabled=true
            
            scrollView.addSubview(titleLabel)
            
            titleLabels.append(titleLabel)
            
            
            
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClick(_:)))
            
            titleLabel.addGestureRecognizer(tapGes)
            
            
        }
        
        
        
        let labelH:CGFloat = style.titleHeight
        let labelY:CGFloat = 0
        var labelW:CGFloat = bounds.width / CGFloat(titles.count)
        var labelX:CGFloat = 0
        
        for (i,titleLabel) in titleLabels.enumerated() {
            
            if style.isScrollEnable {
                
                labelW = (titleLabel.text! as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : style.titleFont], context: nil).width
                
                labelX = i==0 ? style.titleMargin * 0.5 : (titleLabels[i-1].frame.maxX + style.titleMargin)
            }else{
                
                
               labelX = labelW * CGFloat(i)
                
                
            }
            
            titleLabel.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            
        }
        
        if style.isScrollEnable{
            scrollView.contentSize = CGSize(width: titleLabels.last!.frame.maxX + style.titleMargin * 0.5, height: 0)
        }
        
        
        
        
    }
}



extension LTTitleVIew{
    
    
    func titleLabelClick(_ tapGes:UITapGestureRecognizer) {
        
        
        guard let targetLabel = tapGes.view as? UILabel else {
            
            return
        }
        
              
        
    }
    
    
    
    
}
