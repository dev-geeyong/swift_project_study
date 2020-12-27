//
//  BoxofficeViewController.swift
//  201227project
//
//  Created by dev.geeyong on 2020/12/27.
//

import UIKit
import Alamofire
import SwiftyJSON
import JGProgressHUD

class BoxofficeViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var nmLabel1: UILabel!
    
    @IBOutlet var nmLabel2: UILabel!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var nmLabel3: UILabel!
    
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    
    
    @IBAction func clickButton(_ sender: Any) {
        //숫자, 8자리, 입력한 내용이 맞는지 확인하는..
        
        var test = textField.text
        callRequest(date: test!)
        
        
    }
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        callRequest(date: "20111111")

    }
    //labelOutletNameFromStoryBoard, labelTextColor 보충설명 가능 위에서 사용되는 외부매개변수
    // _ 와일드카드 식별자
    //label, color 안에서만 사용.. 내부매개변수
    
    func moviewTitleDesignSetting(_ label: UILabel, labelTextColor color: UIColor){
        
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = color
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.textAlignment = .center
    }
    func callRequest(date : String){
        self.hud.textLabel.text = "Loading"
        self.hud.show(in: self.view)
            
        moviewTitleDesignSetting(self.resultLabel, labelTextColor: .red)
        moviewTitleDesignSetting(self.resultLabel2, labelTextColor: .blue)
        moviewTitleDesignSetting(self.resultLabel3, labelTextColor: .brown)
        
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6435e44991ae7456ca40818fa990c14e&targetDt=\(date)"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
               
            
                let movie1 = json["boxOfficeResult"]["dailyBoxOfficeList"][0]["movieNm"].stringValue
                
                let movie2 = json["boxOfficeResult"]["dailyBoxOfficeList"][1]["movieNm"].stringValue
                let movie3 = json["boxOfficeResult"]["dailyBoxOfficeList"][2]["movieNm"].stringValue
                
                self.nmLabel1.text = movie1
                self.nmLabel2.text = movie2
                self.nmLabel3.text = movie3
                
                print(movie1)
                
                self.hud.dismiss()
            case .failure(let error):
                print(error)
            }
        }
    }

    }

