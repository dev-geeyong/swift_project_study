//
//  ViewController.swift
//  ImagePicker
//
//  Created by dev.geeyong on 2020/12/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self // 뷰 컨트롤러가 픽커의 딜리게이트역할
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUPSelectImageButton(_ sender: UIButton){
        
        self.present(self.imagePicker, animated: true, completion: nil) //모달을 올려줌
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { //취소 경우 모달을 내려줌
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

