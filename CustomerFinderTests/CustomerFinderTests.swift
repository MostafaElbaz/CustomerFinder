//
//  CustomerFinderTests.swift
//  CustomerFinderTests
//
//  Created by Mostafa Elbaz on 3/23/19.
//  Copyright © 2019 Mostafa Elbaz. All rights reserved.
//

import XCTest
@testable import CustomerFinder

class CustomerFinderTests: XCTestCase {

    let customerVM = CustomerViewModel()
    var customerList:[Customer] = []

    override func setUp() {
        let cus1 = Customer(lat: 52.986375, long: -6.043701, userID: 12, name: "Christina McArdle")
        let cus2 = Customer(lat: 51.92893, long: -10.27699, userID: 1, name: "Alice Cahill")
        customerList.append(cus1)
        customerList.append(cus2)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilterCustomer() {
        
      let filteredList = customerVM.filterCustommersByDistanceFrom(customers: customerList, fromLat: SearchSetting.officeLat, fromLong: SearchSetting.officeLong, distance: SearchSetting.maxDistance)
        
        XCTAssert(filteredList.count == 1)
    }

    func testAscendingOrder(){
        let orderedList = customerVM.orderCustomerAscending(customerList: customerList)
        XCTAssert((orderedList.count > 0 && orderedList[0].userId == 1))
    }
    
}
