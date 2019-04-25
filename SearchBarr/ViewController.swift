//
//  ViewController.swift
//  SearchBarr
//
//  Created by Michael Miles on 4/24/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    
    let nameArray = [
        "Michael",
        "Abdul",
        "Derek",
        "Michelle"
    ]
    
    var filteredArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.isHidden = true
        
        filteredArray = nameArray
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableViewTopConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        searchTableView.isHidden = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = nameArray
        
        if searchText.isEmpty == false {
            filteredArray = nameArray.filter({ $0.contains(searchText) })
        }
        
        searchTableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arrayCell", for: indexPath)
        cell.textLabel?.text = filteredArray[indexPath.row]
        return cell
    }
}
