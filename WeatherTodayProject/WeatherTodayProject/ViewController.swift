//
//  ViewController.swift
//  WeatherTodayProject
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    let image:[String] = ["flag_de","flag_fr","flag_it","flag_jp","flag_kr","flag_us"]
    let country:[String] = ["독일","프랑스","이탈리아","일본","한국","미국"]
    
    let cellIdentifier: String = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let text: String = country[indexPath.row]
        let img: String = image[indexPath.row]
        
        cell.textLabel?.text = text
        cell.imageView?.image = UIImage(named: img)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
