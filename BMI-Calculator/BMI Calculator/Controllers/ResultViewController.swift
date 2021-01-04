//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by dev.geeyong on 2021/01/04.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: CalculatorViewController {

    @IBOutlet var resultLabel: UILabel!
    var bmiValue: String?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultLabel.text = bmiValue
       

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
