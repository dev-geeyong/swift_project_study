//
//  WeatherViewController.swift
//  WeatherToday
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    @IBOutlet weak var tableView: UITableView!
    
    var country: String! //이전 페이지에서 받은 나라
    
    let cellIdentifier: String = "cell2"
    var sendData: String!
    
    var weatherCodable: [WeatherCodable] = [] //json파일 받기 위한 struct문으로 된 WeatherCodable 배열으로 변수선언
    
    ///numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherCodable.count
    }
    ///cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        //커스텀 셀을 위해 NewTableViewCell으로 따로 만들어서 선언 스토리보드에서 cell2에 class NewTableViewCell으로 연결
        let cell: NewTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! NewTableViewCell
        
        let weatherCodables: WeatherCodable = self.weatherCodable[indexPath.row]
        
        let fahrenheit = weatherCodables.celsius * 9/5 + 32 //화씨 계산
        
        ///소수점 버림
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .floor         // 형식을 버림으로 지정
        numberFormatter.minimumSignificantDigits = 3 // 자르길 원하는 자릿수
        numberFormatter.maximumSignificantDigits = 3
        let newfahrenheit = numberFormatter.string(from: NSNumber(value: fahrenheit)) //소수점 버림처리
       
        cell.accessoryType = .disclosureIndicator // cell ">"
        
        //커스텀셀 데이터 설정
        cell.weatherCityName.text = weatherCodables.cityName //도시이름
        cell.temperature.text = "섭씨 \(weatherCodables.celsius)도 / 화씨 \(newfahrenheit!)도"
        cell.probability.text = "강수확률 \(weatherCodables.rainfallProbability)%"
        
        //섭씨, 강수확률 데이터 저장(다음 뷰에서 계산 위함)
        cell.celsius = weatherCodables.celsius
        cell.rainfallProbability = weatherCodables.rainfallProbability
        
        //강수확률, 온도에 따른 UIImage named 처리
        if weatherCodables.rainfallProbability > 40 { //강수확률 40이상
            cell.probability.textColor = .orange // 강수확률 강조
            if weatherCodables.celsius < 1 { // 확률이 40이상에 온도가 1도 이하면 눈온다고 처리....
                cell.weatherImage?.image = UIImage(named: "snowy")
            }
            else{
                cell.weatherImage?.image = UIImage(named: "rainy")
            }
        }else if weatherCodables.rainfallProbability > 30 && weatherCodables.rainfallProbability <= 40 {
            //강수확률 40이하 30초과 - 흐림처리
            cell.weatherImage?.image = UIImage(named: "cloudy")
        }
        else{
            cell.weatherImage?.image = UIImage(named: "sunny")
            cell.probability.textColor = .black //dequeueReusableCell 재사용으로 인한.. 오렌지->블랙
        }

        return cell
    }
    //heightForRowAt Cell 높이설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //JSONDecoder - 함수로 처리 - 각 나라에 맞는 데이터.
    func weatherJsonDecoder(countryName: String) {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: countryName) else { return }
        do{
            self.weatherCodable = try jsonDecoder.decode([WeatherCodable].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        //네비게이션바 색상, 데이터 설정
        self.title = country!
        self.navigationController?.navigationBar.barTintColor  = .systemBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        switch country { //JSONDecoder 각 나라에 맞는 값으로 함수호출
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
    //데이터전달 LastViewController으로..  NewTableViewCell 값을..
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: LastViewController = segue.destination as? LastViewController else {
            return
        }
        guard let cell: NewTableViewCell = sender as? NewTableViewCell else {
            return
        }
        nextViewController.city = cell.weatherCityName.text
        nextViewController.weather = cell.weatherImage.image
        nextViewController.temperature = cell.temperature.text
        nextViewController.Probability = cell.probability.text
        nextViewController.textColor = cell.probability.textColor
        
        //강수확률, 온도에 따른 UIImage named 처리위해 전달
        nextViewController.celsius = cell.celsius
        nextViewController.rainfallProbability = cell.rainfallProbability

    }

}

   

