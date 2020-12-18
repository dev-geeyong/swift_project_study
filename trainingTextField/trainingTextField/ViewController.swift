//
//  ViewController.swift
//  trainingTextField
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.text = "비밀번호는 비밀"
        myTextField.placeholder = "입력하세요"
        myTextField.isSecureTextEntry = true
        myTextField.keyboardType = .phonePad
        myTextField.textColor = .red
        myTextField.borderStyle = .line
    }
    //키보드내리기
    @IBAction func tabtab(_ sender:  UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

