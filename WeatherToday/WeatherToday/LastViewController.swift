//
//  LastViewController.swift
//  WeatherToday
//
//  Created by dev.geeyong on 2020/12/24.
//

import UIKit

class LastViewController: UIViewController {

    var city: String!
    var weather: UIImage!
    var temperature: String!
    var Probability: String!
    var textColor: UIColor!
    var sendData: String!
    var celsius: Float!
    var rainfallProbability: Int!
    
    
    @IBOutlet var weatherResult: UILabel!
    @IBOutlet var rainProbability: UILabel!
    @IBOutlet var weatherTemperature: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = weather
        weatherTemperature.text = temperature!
        rainProbability.text = Probability!
        rainProbability.textColor = textColor!
       
        self.title = city!
        
        //강수확률, 온도에 따른 UIImage named 처리
        if rainfallProbability > 40 { //강수확률 40이상
            if celsius < 1 { // 확률이 40이상에 온도가 1도 이하면 눈
                weatherResult.text = "눈"
            }
            else{
                weatherResult.text = "비"
            }
        }
        else if rainfallProbability > 30 && rainfallProbability <= 40{
            weatherResult.text = "흐림"
        }
        else{
            weatherResult.text = "맑음"
        }
    
    }

}
