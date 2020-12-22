//
//  SecondViewController.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class SecondViewController: UIViewController ,UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var contentTextFiield: UITextField!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var checkPassWord: UITextField!
    
    @IBOutlet var imageView: UIImageView! //이미지 뷰 선언
   
    @IBOutlet var nextButton: UIButton!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true //이미지 수정가능하게
        return picker
    }()
    
    //[tfield.text length] > 0 && tfield.text != nil && [tfield.text isEqual:@""] == FALSE
   
    override func viewDidLoad() { //뷰디드로드
        
        super.viewDidLoad()
        nextButton.isEnabled = false
        //키보드 내리기
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
      
            
        
        
        //이미지 탭
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func tapView (_ sender: UITapGestureRecognizer){ //키보드 내리기 함수
        self.view.endEditing(true)
        if contentTextFiield.text?.isEmpty ?? true ||
            idTextField.text?.isEmpty ?? true ||
            passWord.text?.isEmpty ?? true ||
            checkPassWord.text?.isEmpty ?? true ||
            self.imageView.image == nil ||
            passWord.text! != checkPassWord.text!
            {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) //이미지 뷰 클릭시..
    {
        self.present(self.imagePicker, animated: true, completion: nil)
       
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { //취소 경우 모달을 내려줌
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //앨범 선택
        
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        self.imageView.image = newImage // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        UserInformation.sharedData.userId = idTextField.text
        
    }
    
    
    
}
