//
//  CityViewController.swift
//  TwoFlowerSelection
//
//  Created by zhanght on 16/6/1.
//  Copyright © 2016年 zhanght. All rights reserved.
//

import UIKit

class CityViewController: BaseViewController {

    let cityCellIdentifier = "cityCellIdentifier"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "同城"
        
        //tableView
        tableView.registerNib(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: cityCellIdentifier)
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
        return CityCell.cellHeight()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CityCell = tableView.dequeueReusableCellWithIdentifier(cityCellIdentifier, forIndexPath: indexPath) as! CityCell
        return cell
    }

    

}
