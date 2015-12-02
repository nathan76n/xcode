//
//  MasterViewController.swift
//  JSON
//
//  Created by Nguyen, Nathan on 11/30/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [[String: String]]()


    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://www.blog.invesco.us.com/json"
        
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                let json = JSON(data: data)
            
                //if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're ok to parse!
                    parseJSON(json)
                //}
            }
        }
        
    }

    func parseJSON(json: JSON) {
        for result in json.arrayValue {
            let title = result["title"].stringValue
            let author = result["author"].stringValue
            let content = result["content"].stringValue
            let obj = ["title": title, "author": author, "content": content]
            objects.append(obj)
        }
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row]
                let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                controller.detailItem = object
                //println(object)
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = objects[indexPath.row]
        cell.textLabel!.text = object["title"]
        cell.detailTextLabel!.text = object["author"]
        return cell
    }



}

