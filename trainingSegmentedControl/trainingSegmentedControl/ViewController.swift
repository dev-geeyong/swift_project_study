//
//  ViewController.swift
//  trainingSegmentedControl
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var myControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
//        myControl.selectedSegmentIndex = 1
//        myControl.removeSegment(at: 0, animated: true)
//        myControl.insertSegment(withTitle: "기타", at: 0, animated: true)
        
        
//        myControl.backgroundColor = .lightGray
//        myControl.selectedSegmentTintColor = .black //myControl.tintColor을 이걸
        mySlider.minimumValue = 0
        mySlider.maximumValue = 1
//
    }
    
    @IBAction func segementedChanged(_ sender: UISegmentedControl) {
        if myControl.selectedSegmentIndex == 0 {
            print("0 click")
            myLabel.text = "0 id"
            mySlider.value = 0.5
            mySwitch.setOn(false, animated: true)
            
        }
        else if myControl.selectedSegmentIndex == 1{
            myLabel.text = " 1111"
            mySlider.value = 1
        }
        else{
            print("others")
            myLabel.text = "others"
            mySwitch.setOn(true, animated: true)
        }
    }
    

}

