//
//  ViewController.swift
//  traingLabel
//
//  Created by dev.geeyong on 2020/12/07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dataPicker: UIDatePicker!
    
    @IBOutlet weak var dataview: UILabel!
    
    
    @IBAction func dataselect(_ sender: UIDatePicker) {
        dataview.text = "\(dataPicker.date)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}

