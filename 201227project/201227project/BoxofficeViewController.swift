//
//  BoxofficeViewController.swift
//  201227project
//
//  Created by dev.geeyong on 2020/12/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class BoxofficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6435e44991ae7456ca40818fa990c14e&targetDt=20201220"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }

    }
    

    }

