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

    @IBOutlet var nmLabel1: UILabel!
    
    @IBOutlet var nmLabel2: UILabel!
    
   
    @IBOutlet var nmLabel3: UILabel!
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        
        self.hud.textLabel.text = "Loading"
        self.hud.show(in: self.view)
        
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6435e44991ae7456ca40818fa990c14e&targetDt=20201220"
        
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

