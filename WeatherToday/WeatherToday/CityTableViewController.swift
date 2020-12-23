//
//  CityTableViewController.swift
//  WeatherToday
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class CityTableViewController: UITableViewController {

    @IBOutlet weak var cityNameTest: UILabel!
    var dataSet: String!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
}
