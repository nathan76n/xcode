//
//  ViewController.swift
//  Bouncing Labels
//
//  Created by Nguyen, Nathan on 5/27/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // create ivars
    var myFirstLabel: UILabel!
    var iPhoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create labels
        myFirstLabel = UILabel()
        iPhoneLabel = UILabel()
        addLabels()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTapGesture:"))
        view.addGestureRecognizer(tapGesture)
    }

    func handleTapGesture(tapGesture: UITapGestureRecognizer) {
        addLabels()
    }
    
    func addLabels() {
        myFirstLabel.text = "My First"
        myFirstLabel.font = UIFont.systemFontOfSize(36)
        myFirstLabel.sizeToFit()
        myFirstLabel.center = CGPoint(x: 0, y: 240)
        view.addSubview(myFirstLabel)
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: {
            
            self.myFirstLabel.center = CGPoint(x: 0 + 100, y: 240)
            
            }, completion: nil)
        
        iPhoneLabel.text = "iPhone App"
        iPhoneLabel.font = UIFont.boldSystemFontOfSize(44)
        iPhoneLabel.sizeToFit()
        iPhoneLabel.center = CGPoint(x: 120, y: 90)
        view.addSubview(iPhoneLabel)
        
        iPhoneLabel.alpha = 0
        
        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: nil, animations: {
            
            self.iPhoneLabel.center = CGPoint(x: 120, y: 90 + 200)
            self.iPhoneLabel.alpha = 1
            
            }, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

