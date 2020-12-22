//
//  ViewController.swift
//  MyDatePicker
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        
        let date: Date = self.datePicker.date
        let dateToString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateToString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
        
        // Do any additional setup after loading the view.
    }


}

