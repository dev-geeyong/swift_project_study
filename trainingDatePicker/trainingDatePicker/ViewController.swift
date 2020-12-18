//
//  ViewController.swift
//  trainingDatePicker
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myPicker: UIDatePicker!
    @IBOutlet var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        
//        let format = DateFormatter()
//        format.dateFormat = "yyyy. MM. dd - HH:mm:ss"
//        //format.locale = Locale(identifier: "ko_KR")
//
//        dateLabel.text = format.string(from: myPicker.date)
        //데이터피커 날짜값을 문자로 표현하는 방식
        
        //문자형태의 날짜값을 표현
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd HH:mm:ss"
        let result = format.date(from: "19950414    10:10:10")
        
        dateLabel.text = "\(result)"
        myPicker.date = result!
        //dateLabel.text = "\(myPicker.date)"
        
    }
    
}

