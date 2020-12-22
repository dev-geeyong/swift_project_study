//
//  ThirdViewController.swift
//  SignUp
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var phoneNumber: UITextField!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var sumitButton: UIButton!
    @IBOutlet var beforeButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let date: Date = self.datePicker.date
        let dateToString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateToString
       
        if phoneNumber.text?.isEmpty ?? true ||
            dateLabel.text! == "" {
            sumitButton.isEnabled = false
        }
        else{
            sumitButton.isEnabled = true
        }
        
        
    }
  
    @IBAction func touchBeforeButton(_ sender: Any) {
        UserInformation.sharedData.dateValue = self.dateLabel.text
        UserInformation.sharedData.phoneNumber = self.phoneNumber.text
    }
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
        if phoneNumber.text?.isEmpty ?? true ||
            dateLabel.text! == "" {
            sumitButton.isEnabled = false
        }
        else{
            sumitButton.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumitButton.isEnabled = false
      
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        if (UserInformation.sharedData.dateValue != nil) {
            self.dateLabel.text = UserInformation.sharedData.dateValue
        }
        if (UserInformation.sharedData.phoneNumber != nil) {
            self.phoneNumber.text = UserInformation.sharedData.phoneNumber
        }
        

        // Do any additional setup after loading the view.
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
