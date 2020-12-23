//
//  ViewController.swift
//  SimpleTableView
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let cellIdentifier: String = "cell"
    let customCellIdentfier: String = "customCell"
    
    let korean: [String] = ["가","나","다","라","마","바","사","아","자","차","카","타","파","하"]
    let english: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","n","m"]
    var dates: [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium

        return formatter
    }()
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        dates.append(Date())
        //self.tableView.reloadData() //전체의 데이터를 다시불러와서 비효율
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView - delegate,dataSource 설정
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    //섹션 수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 //한글, 영어, dates 섹션
    }
    
    //tableview의 row 수 설정 numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return dates.count
        default:
            return 0
        }
    }
    //row마다 해당하는 셀을 돌려달라
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        
        if indexPath.section < 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            cell.textLabel?.text = text
            if indexPath.row == 1 {
                cell.backgroundColor = .red
            }
            else{
                cell.backgroundColor = .white
                
            }
            return cell
            
        }else{ //date가 추가되는경우
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentfier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel?.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            cell.rightLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            return cell
            
        }
       
        
    }
    //타이틀 titleForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
        return section == 0 ? "한글" : "영어"
        }
        else{
            return nil
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //도착지 정해주고
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else{
            return
        }
        //보낼 값 정해주고
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.dataTest = cell.textLabel?.text

    }
    


}

