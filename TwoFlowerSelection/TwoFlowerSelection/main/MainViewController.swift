//
//  MainViewController.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/1.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit


class MainViewController: BaseViewController {

    let kMainListCellIdentifier = "kMainListCellIdentifier"
    
    var flowView:FlowView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "精选"
        
        //tableView
        tableView.registerNib(UINib(nibName: "MainListCell", bundle: nil), forCellReuseIdentifier: kMainListCellIdentifier)
        
        flowView = FlowView(frame: CGRectMake(0, 0, self.view.bounds.size.width, 150))
        let images = NSMutableArray()
        for i in 1...7 {
            let image:UIImage = UIImage(named: String(format: "%d", i))!
            images.addObject(image)
        }
        flowView.images = images as [AnyObject]
        flowView.reloadData()
        tableView.tableHeaderView = flowView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return MainListCell.cellHeight()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:MainListCell = tableView.dequeueReusableCellWithIdentifier(kMainListCellIdentifier, forIndexPath: indexPath) as! MainListCell
        return cell
    }

}
