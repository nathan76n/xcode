//
//  Restaurant.swift
//  FoodFinds
//
//  Created by Nguyen, Nathan on 2/5/15.
//  Copyright (c) 2015 Nguyen, Nathan. All rights reserved.
//

import Foundation

class Restaurant {
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var phone:String = ""
    var image:String = ""
    var isVisited:Bool = false
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool, phone: String) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}