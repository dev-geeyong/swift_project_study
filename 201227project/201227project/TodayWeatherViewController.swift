////
////  TodayWeatherViewController.swift
////  201227project
////
////  Created by dev.geeyong on 2020/12/27.
////
////라이브러리설치 alamofire + swiftyJSON
//// Request: 인증키 + 위도/경도
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class TodayWeatherViewController: UIViewController {
//    @IBOutlet var tempLabel: UILabel!
//    
//    @IBOutlet var backgroundView: UIView!
//    @IBOutlet var imageView: UIImageView!
//    @IBOutlet var speedLabel: UILabel!
//    @IBOutlet var messageLabel: UILabel!
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        
//        let url = "https://api.openweathermap.org/data/2.5/weather?lat=37&lon=126&appid=8f88c0e5031c0e1057dfdb63da25ca82"
//        
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print("JSON: \(json)")
//                
//                let currentTemp = json["main"]["temp"].doubleValue-273.15
//                self.tempLabel.text = "\(currentTemp)°C"
//                if currentTemp < 0 {
//                    self.backgroundView.backgroundColor = .blue
//                    self.messageLabel.text = "춥다아아아"
//                }
//                else {
//                    self.backgroundView.backgroundColor = .green
//                    self.messageLabel.text = "따아아듯"
//                    
//                }
//                
//                let speed = json["wind"]["speed"].doubleValue
//                self.speedLabel.text = "\(speed)m/s의 바람"
//                print(currentTemp)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//    }
//    
//
//}
