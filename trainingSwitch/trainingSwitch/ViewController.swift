//
//  ViewController.swift
//  trainingSwitch
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var switchTrainig: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchTrainig.setOn(false, animated: true)
        switchTrainig.onTintColor = .red //배경컬러
        switchTrainig.thumbTintColor = .blue //동그라미
        
        
        
    }


    @IBAction func clickSwitch(_ sender: UISwitch) {
        switchOnOrOff()
        
    }
    
    func switchOnOrOff() {
        if switchTrainig.isOn{
            resultLabel.text = "스위치 온"
        }
        else{
            resultLabel.text = "스위치 오프"
        }
    }
}

