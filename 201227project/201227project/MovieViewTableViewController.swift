//
//  MovieViewTableViewController.swift
//  201227project
//
//  Created by dev.geeyong on 2020/12/27.
//

import UIKit

class MovieViewTableViewController: UITableViewController {

    let list = ["조제","어벤저스","하늘","땅","펜트파아수","여섯개","test","bored","safe","geeyong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }//셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    //셀의 디자인 및 데이터 처리
    //셀의 높이
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as! NewTableViewCell //타입캐스팅
        
        cell.labelView.text = list[indexPath.row]
        
        cell.labelView2.text = "\(indexPath)"
        
        return cell
        
        
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell")!
//
//        cell.textLabel?.text = "hi?"
//        cell.textLabel?.textColor = .green
//        cell.detailTextLabel?.text = "안녕하세요"
//
//
//            cell.detailTextLabel?.text = list[indexPath.row]
//
//        return cell
//    }

}

