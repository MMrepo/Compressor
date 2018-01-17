//
//  ChildViewController.swift
//  Compressor-Example
//
//  Created by Merrick Sapsford on 24/11/2017.
//  Copyright © 2017 UI At Six. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}

extension ChildViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("didScroll: \(scrollView.contentOffset)")
    }
}
