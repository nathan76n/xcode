//
//  ViewController.swift
//  RaceCar
//
//  Created by Nathan Nguyen on 2/8/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBAction func honkButton(sender: AnyObject) {
        var myCar = RaceCar()
        brandLabel.text = myCar.brand
        colorLabel.text = myCar.color
        speedLabel.text = String(myCar.speed)
        
        myCar.honk()
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

