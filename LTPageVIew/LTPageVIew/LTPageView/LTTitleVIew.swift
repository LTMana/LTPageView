//
//  LTTitleVIew.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit


protocol LTTitleVIewDelegate : class {
    
    
    func titleView(_ titleView : LTTitleVIew , targetIndex : Int)
    
}


class LTTitleVIew: UIView {
    
    
    weak var delegate : LTTitleVIewDelegate?

    fileprivate var titles:[String]
    fileprivate var style: LTPageStyle
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    fileprivate var currentIndex : Int = 0

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
        
        guard targetLabel.tag != currentIndex else {
            return
        }
        
        let sourceLabel = titleLabels[currentIndex]
        sourceLabel.textColor = style.normalColor
        targetLabel.textColor = style.selectColor
        
        currentIndex = targetLabel.tag
        
        var offsetX = targetLabel.center.x - scrollView.bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        let maxOffsetX = scrollView.contentSize.width - scrollView.bounds.width
        
        if offsetX > maxOffsetX {
            offsetX = maxOffsetX
        }
       
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
        
        delegate?.titleView(self, targetIndex: currentIndex)
        
    
    }
    
    
    
    
}
