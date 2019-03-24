//
//  CustomerViewModel.swift
//  CustomerFinder
//
//  Created by Mostafa Elbaz on 3/23/19.
//  Copyright © 2019 Mostafa Elbaz. All rights reserved.
//

import UIKit

class CustomerViewModel: NSObject {
    
    
    func getCustomerList() -> CustomerResponse{
        if let path = Bundle.main.path(forResource: "customers", ofType: "txt") {
            do {
                let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                let myStrings = text.components(separatedBy: NSCharacterSet.newlines)
                var customerList: [Customer] = []
                for str in myStrings{
                    if let obj = str.toJSON() {
                        let customer = Customer(jsonObj: obj as! [String:AnyObject])
                        customerList.append(customer)
                    }
                }
                
                let customerFiltered = self.filterCustommersByDistanceFrom(customers: customerList, fromLat: SearchSetting.officeLat, fromLong: SearchSetting.officeLong, distance: SearchSetting.maxDistance)
                
                let customerOrdered = self.orderCustomerAscending(customerList: customerFiltered)
                
                let response = CustomerResponse.init(status: true, customerList:customerOrdered)
                return response

            } catch {
                let response = CustomerResponse.init(status: false, customerList:nil)
                return response

            }
        } else {
            let response = CustomerResponse.init(status: false, customerList:nil)
            return response

        }        
    }
    
    
    
    func filterCustommersByDistanceFrom(customers:[Customer],fromLat:Double,fromLong:Double,distance:Double) -> [Customer] {
        var customerFiltered: [Customer] = []
        
        for customer in customers{
            let disMeter =  HaversineDinstance.getDistanceBetween(la1: fromLat, lo1: fromLong, la2: customer.latitude, lo2: customer.longitude)
            
            let disKM = disMeter/1000
            
            if disKM  <= distance {
                customerFiltered.append(customer)
            }
        }
        
        return customerFiltered
    }
    
    func orderCustomerAscending(customerList: [Customer]) -> [Customer] {
        
        let customerOrdered = customerList.sorted { (customer1, customer2) -> Bool in
            return customer1.userId < customer2.userId
        }
        return customerOrdered
    }
    
}
