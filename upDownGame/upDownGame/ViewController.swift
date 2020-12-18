//
//  ViewController.swift
//  upDownGame
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet var resultLabel: UILabel!
    let result = Int.random(in: 0...100)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(result)
        
        
    }


    @IBAction func myButton(_ sender: Any) {
        var test =  Int(inputNumber.text!)
        if result == test {
            resultLabel.text = "Bingo!"
        }
        else if result > test! {
            resultLabel.text = "up"
        }
        else{
            resultLabel.text = "down"
        }
    }
}

