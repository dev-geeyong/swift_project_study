//
//  ThirdViewController.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var phoneNumber: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var sumitButton: UIButton!
    @IBOutlet var beforeButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    //DateFormatter
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    // MARK: - IBAction
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) { //달력 값 변경
        let date: Date = self.datePicker.date
        let dateToString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateToString
       
        //전화번호 or 달력 값이없는 경우 sumitButton 비활성화
        if phoneNumber.text?.isEmpty ?? true ||
            dateLabel.text! == "" {
            sumitButton.isEnabled = false
        }
        else{
            sumitButton.isEnabled = true
        }
    }
  
    //취소버튼 클릭 - 아이디값 초기화
    @IBAction func touchCancelButton(_ sender: UIButton) {
        UserInformation.sharedData.userId = nil
    }
    //이전버튼 클릭 - 입력값 저장
    @IBAction func touchBeforeButton(_ sender: Any) {
        UserInformation.sharedData.dateValue = self.dateLabel.text
        UserInformation.sharedData.phoneNumber = self.phoneNumber.text
    }
    //키보드 내리기 함수
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
        
        //전화번호 or 달력 값이없는 경우 sumitButton 비활성화
        if phoneNumber.text?.isEmpty ?? true ||
            dateLabel.text! == "" {
            sumitButton.isEnabled = false
        }
        else{
            sumitButton.isEnabled = true
        }
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        sumitButton.isEnabled = false
      
        //키보드 내리기
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        //이전버튼 클릭 - 이후 저장된 데이터가 존재한다면 불러오기..
        if (UserInformation.sharedData.dateValue != nil) {
            self.dateLabel.text = UserInformation.sharedData.dateValue
        }
        if (UserInformation.sharedData.phoneNumber != nil) {
            self.phoneNumber.text = UserInformation.sharedData.phoneNumber
        }
    }

}
