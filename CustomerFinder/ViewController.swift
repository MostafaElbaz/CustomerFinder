//
//  ViewController.swift
//  CustomerFinder
//
//  Created by Mostafa Elbaz on 3/23/19.
//  Copyright © 2019 Mostafa Elbaz. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    @IBOutlet weak var customerTableView: UITableView!
    var customerList: [Customer] = []
    let customerVM = CustomerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCustomerList()
    }
    
    func getCustomerList() {
        customerList = []
        let response = customerVM.getCustomerList()
        if response.status {
            customerList = response.customerList!
        }else{
            SVProgressHUD.showError(withStatus: "Sorry, error happened while retrieving customer data. Please Try again later.")
        }
        
        customerTableView.reloadData()
    }
    
    @IBAction func btnReloadTapped(_ sender: Any) {
        getCustomerList()
    }
    
}


extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell") as! CustomerTableViewCell
        let customr = customerList[indexPath.row]
        cell.lblCustomerID.text = String(customr.userId)
        cell.lblCustomerName.text = customr.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList.count
    }
    
}

