//
//  UIColor-Extension.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func randomColor() ->UIColor{
        
        return UIColor(red:CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha:1.0)
    }
    
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat=1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    
    convenience init?(hexString:String) {
        
        guard hexString.characters.count >= 6 else{
            return nil
        }
        
        var hexTempString = hexString.uppercased()
        if hexTempString.hasPrefix("0X") || hexTempString.hasSuffix("##") {
            hexTempString = (hexTempString as NSString).substring(from: 2)
        }
        
        if hexTempString.hasPrefix("#") {
            hexTempString = (hexTempString as NSString).substring(from: 1)
        }
        
        var range = NSRange(location:0,length:2)
        let rHex = (hexTempString as NSString).substring(with: range)
        range.location = 2
        let gHex = (hexTempString as NSString).substring(with: range)
        range.location = 4
        let bHex = (hexTempString as NSString).substring(with: range)
        
        var r:UInt32 = 0
        var g:UInt32 = 0
        var b:UInt32 = 0
        
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        

        self.init(r:CGFloat(r),g:CGFloat(g),b:CGFloat(b))
        
        
    }
    
    
    
    
    
}
