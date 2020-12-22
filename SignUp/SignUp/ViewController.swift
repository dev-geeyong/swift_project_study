//
//  ViewController.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    
    
    @IBOutlet var userIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdTextField.text = UserInformation.sharedData.userId
     
        }
         
}

