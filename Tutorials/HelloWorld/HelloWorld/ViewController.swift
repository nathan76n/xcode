//
//  ViewController.swift
//  HelloWorld
//
//  Created by Nguyen, Nathan on 1/26/15.
//  Copyright (c) 2015 Nguyen, Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonHellow(sender: AnyObject) {
        let alertController = UIAlertController(title: "Welcome to my App", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

