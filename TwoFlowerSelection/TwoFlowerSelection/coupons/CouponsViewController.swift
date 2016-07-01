//
//  CouponsViewController.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/1.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit

class CouponsViewController: BaseViewController {
    
    let couponsCellIdentifier = "couponsCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "优惠券"
        
        //tableView
        tableView.registerNib(UINib(nibName: "CouponsCell", bundle: nil), forCellReuseIdentifier: couponsCellIdentifier)
        
        
    }


    
    //MARK: tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CouponsCell.cellHeight(7)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CouponsCell = tableView.dequeueReusableCellWithIdentifier(couponsCellIdentifier, forIndexPath: indexPath) as! CouponsCell
        
        cell.setInfo([CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link"), CouponsModel(name: "name", image: "image", link: "link")])
        
        return cell
    }

}
