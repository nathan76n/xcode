//
//  RaceCar.swift
//  RaceCar
//
//  Created by Nathan Nguyen on 2/8/15.
//  Copyright (c) 2015 nigmia. All rights reserved.
//

import UIKit

class RaceCar: NSObject {
    var brand:String = "Ferrari"
    var color:String = "Red"
    var speed:Int = 200
    
    func honk(){
        println("Honk, honk")
    }
}
