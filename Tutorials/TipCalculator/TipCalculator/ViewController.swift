//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nathan Nguyen on 1/17/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var percentSegment: UISegmentedControl!

    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculateButton(sender: AnyObject) {
        
        var userString = billTextField.text as String
        var totalBill: Float = NSString(string: userString).floatValue
        var index: Int = percentSegment.selectedSegmentIndex
        
        var tipRate: Float = 0.15
        
        if index == 0 {
            tipRate = 0.15
        } else if index == 1 {
            tipRate = 0.20
        } else {
            tipRate = 0.25
        }
        
        var tip: Float = totalBill * tipRate
        
        resultLabel.text = "$\(tip)"
        
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

