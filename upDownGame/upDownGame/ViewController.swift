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
        inputNumber.delegate = self
       
        print(result)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var input = Int(inputNumber.text!)
        if result == input {
            resultLabel.text = "Bingo!"
        }
        else if result > input! {
            resultLabel.text = "up"
        }
        else{
            resultLabel.text = "down"
        }
        
        return true
    }


    @IBAction func myButton(_ sender: Any) {
        
    }
}

