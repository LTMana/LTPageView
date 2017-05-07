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
    
    init(frame: CGRect,titles:[String],style:LTPageStyle){
        self.titles = titles
        self.style = style
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
