//
//  ViewController.swift
//  JsonDecoder
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    var friends: [Friends] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let friend: Friends = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.city_name
      
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "fr") else {
            return
        }
        do{
            self.friends = try jsonDecoder.decode([Friends].self, from: dataAsset.data)
        }
        catch{
            print("여기임?")
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }


}

