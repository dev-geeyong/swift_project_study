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
        
        //키보드 내리기
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        }
    override func viewWillAppear(_ animated: Bool) { // 취소, 가입 버튼으로 화면이 리로드될때
        userIdTextField.text = UserInformation.sharedData.userId
        
        
    }
    @IBAction func tapView (_ sender: UITapGestureRecognizer){ //키보드 내리기
        self.view.endEditing(true)
    }
         
}

