//
//  SecondViewController.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class SecondViewController: UIViewController ,UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // MARK: - 변수
    @IBOutlet var contentTextFiield: UITextField!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passWord: UITextField!
    @IBOutlet var checkPassWord: UITextField!
    
    @IBOutlet var imageView: UIImageView! //이미지 뷰 선언
    @IBOutlet var nextButton: UIButton!
    
    // MARK: - imagePicker 변수선언
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true //이미지 수정가능하게
        return picker
    }()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
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
    // MARK: - 함수
    @IBAction func tapView (_ sender: UITapGestureRecognizer){ //키보드 내리기 함수
        self.view.endEditing(true)
        
        //화면에 값들이 다 채워져있는지 확인 후 버튼을 활성화 or 비활성화
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
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) //이미지 뷰 클릭시..imagePicker을 띄워주기
    {
        self.present(self.imagePicker, animated: true, completion: nil)
       
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { //imagePicker에서 취소 경우..dismiss 처리
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //앨범 선택
        
        var newImage: UIImage? = nil
        
        // 수정된 이미지가 있을 경우
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        }
        // 원본 이미지가 있을 경우
        else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        self.imageView.image = newImage // 받아온 이미지를 update
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
    
    
    // MARK: - IBAction
    @IBAction func nextButton(_ sender: Any) {
        UserInformation.sharedData.userId = idTextField.text
        
    }
    
    
    
}
