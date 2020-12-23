//
//  WeatherViewController.swift
//  WeatherToday
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var country: String!
    
    let cellIdentifier: String = "cell2"
    var friends: [Friends] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .floor         // 형식을 버림으로 지정
        numberFormatter.minimumSignificantDigits = 3 // 자르길 원하는 자릿수
        numberFormatter.maximumSignificantDigits = 3

        let cell: NewTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! NewTableViewCell
        
        let friend: Friends = self.friends[indexPath.row]
        let fahrenheit = friend.celsius * 9/5 + 32
        let newfahrenheit = numberFormatter.string(from: NSNumber(value: fahrenheit))
        cell.weatherCityName.text = friend.city_name
        cell.accessoryType = .disclosureIndicator
        cell.temperature.text = "섭씨 \(friend.celsius)도 / 화씨 \(newfahrenheit!)도"
        cell.probability.text = "강수확률 \(friend.rainfall_probability)%"
        if friend.rainfall_probability > 40 {
            cell.weatherImage?.image = UIImage(named: "rainy")
        }
        else{
            cell.weatherImage?.image = UIImage(named: "sunny") 
        }
      
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func weatherJsonDecoder(countryName: String) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: countryName) else { return }
        do{
            self.friends = try jsonDecoder.decode([Friends].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = country!
        
        
        
        switch country {
        case "독일":
            weatherJsonDecoder(countryName: "de")
        case "프랑스":
            weatherJsonDecoder(countryName: "fr")
        case "이탈리아":
            weatherJsonDecoder(countryName: "it")
        case "일본":
            weatherJsonDecoder(countryName: "jp")
        case "한국":
            weatherJsonDecoder(countryName: "kr")
        case "미국":
            weatherJsonDecoder(countryName: "us")
            
        default:
            return
        }
        
        
        self.tableView.reloadData()
    }
    }

   

