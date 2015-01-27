//
//  ViewController.swift
//  SimpleTable
//
//  Created by Nguyen, Nathan on 1/27/15.
//  Copyright (c) 2015 Nguyen, Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teaka", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Pappaduex", "Pot Belly", "Olive Garden", "Langford's", "Luby's"]
    var restaurantPics = ["restaurant", "pic2", "pic3", "pic3", "pic3", "pic3", "pic3", "pic3", "pic3", "pic3", "pic3"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = restaurantNames[indexPath.row]
        cell.imageView.image = UIImage(named: restaurantPics[indexPath.row])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

