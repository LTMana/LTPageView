//
//  LTContentView.swift
//  LTPageVIew
//
//  Created by liubotong on 2017/5/8.
//  Copyright © 2017年 LTMana. All rights reserved.
//

import UIKit
private let kContentCellID = "content"
class LTContentView: UIView {
    fileprivate var childVcs:[UIViewController]
    fileprivate var parentVc:UIViewController
    fileprivate lazy var collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:kContentCellID)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.scrollsToTop = false //点击状态栏页面滚回最顶部
        return collectionView
    }()
    init(frame: CGRect,childVcs:[UIViewController],parentVc:UIViewController){
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension LTContentView{
    
    fileprivate func setupUI(){
        for childVc in childVcs {
            parentVc.addChildViewController(childVc)
        }
        
        addSubview(collectionView)
    }
    
}

extension LTContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentCellID, for: indexPath)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let childVc = childVcs[indexPath.item]
        cell.contentView.addSubview(childVc.view)
        
        return cell
        
    }
    
    
}


extension LTContentView : UICollectionViewDelegate{
    
    
    
}










