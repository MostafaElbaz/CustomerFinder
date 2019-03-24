//
//  customer.swift
//  CustomerFinder
//
//  Created by Mostafa Elbaz on 3/23/19.
//  Copyright © 2019 Mostafa Elbaz. All rights reserved.
//

struct Customer {
    var latitude: Double = 0
    var longitude: Double = 0
    var userId: Int = 0
    var name: String = ""
    
    init(jsonObj: [String:AnyObject]) {
        latitude =  Double( jsonObj["latitude"] as! String) ?? 0
        longitude =  Double( jsonObj["longitude"] as! String) ?? 0
        userId =  jsonObj["user_id"] as! Int
        name =  jsonObj["name"] as! String
    }
    
    init(lat: Double, long:Double, userID: Int,name:String) {
        latitude = lat
        longitude =  long
        userId =  userID
        self.name =  name
    }
}
