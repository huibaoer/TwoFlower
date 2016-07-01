//
//  CouponsCell.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/30.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit

class CouponsCell: UITableViewCell {
    
    let collectionCellIdentifier = "collectionCellIdentifier"
    let screenWidth = UIScreen.mainScreen().bounds.size.width;
    @IBOutlet weak var collectionView: UICollectionView!
    var couponsArray: [CouponsModel] = [];
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical  //滚动方向
        layout.itemSize = CGSizeMake(screenWidth/3.0, screenWidth/3.0)
        layout.minimumLineSpacing = 0  //上下间隔
        layout.minimumInteritemSpacing = 0 //左右间隔

        self.collectionView.collectionViewLayout = layout
        self.collectionView.registerNib(UINib.init(nibName: "CouponsCellItem", bundle: nil), forCellWithReuseIdentifier: collectionCellIdentifier)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    class func cellHeight(itemCount:Int) -> CGFloat {
        return CGFloat(ceil(Double(itemCount) / 3.0) * Double(UIScreen.mainScreen().bounds.size.width)/3.0) + 1
    }
    
    //MARK: collectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return couponsArray.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    func setInfo(infos:[CouponsModel]) {
        self.couponsArray = infos
    }
}
