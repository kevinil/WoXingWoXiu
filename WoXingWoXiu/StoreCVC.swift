//
//  StoreCVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit


class StoreCVC: UICollectionViewController {

    var rectSize : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HiddenBackNavTitle(self)
        tabBarController?.tabBar.hidden = true
        setupSize()
    }
    
    func setupSize() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsetsMake(25, 10, 0, 10)
        rectSize = (view.bounds.width - 40) / 2
        layout.itemSize = CGSizeMake(rectSize, rectSize * 7 / 6)
        collectionView!.collectionViewLayout = layout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("storeCell", forIndexPath: indexPath)
        return cell
    }

}
