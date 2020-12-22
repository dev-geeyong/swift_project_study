//
//  ViewController.swift
//  ViewTransition
//
//  Created by dev.geeyong on 2020/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.name = nameField.text
        UserInformation.shared.age = ageField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

