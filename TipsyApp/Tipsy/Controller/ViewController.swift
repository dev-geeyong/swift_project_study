//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputBillTextFiled: UITextField!
    @IBOutlet var tipButton0: UIButton!
    
    @IBOutlet var tipButton20: UIButton!
    @IBOutlet var tipButton10: UIButton!
    var selectTip = 0.0
    var resultToStirng = ""
    var splitNumber = 0.0
    @IBOutlet var splitNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUPSplitButton(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    @IBAction func touchUpTipButton(_ sender: UIButton) {
        inputBillTextFiled.endEditing(true)
        if sender.currentTitle! == "0%"{
            tipButton0.isSelected = true
            tipButton20.isSelected = false
            tipButton10.isSelected = false
            selectTip = 0
        }
        else if sender.currentTitle! == "10%"{
            tipButton10.isSelected = true
            tipButton20.isSelected = false
            tipButton0.isSelected = false
            selectTip = 0.1
        }
        else if sender.currentTitle! == "20%"{
            tipButton20.isSelected = true
            tipButton0.isSelected = false
            tipButton10.isSelected = false
            selectTip = 0.2
        }
        
    }
    
    @IBAction func touchUpcalculateButton(_ sender: UIButton) {
        let inputNumber = Double(inputBillTextFiled.text ?? "0.0")
        splitNumber = Double(splitNumberLabel.text ?? "0.0") ?? 0.0
        
        
        let result = (inputNumber! + inputNumber! * selectTip) / splitNumber
        
        resultToStirng = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
       
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultNumber = resultToStirng
            destinationVC.resultString = "Split between \(splitNumber), with \(selectTip)% tip."
            
            
        }
    }
    
    

}

