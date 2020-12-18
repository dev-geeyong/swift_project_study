//
//  ViewController.swift
//  trainingButton
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitle("안녕!?", for: .normal)
        myButton.setTitle("까꿍!", for: .highlighted)
        myButton.setTitleColor(UIColor.green, for: .normal)
        myButton.setTitleColor(UIColor.red, for: .highlighted)
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        myButton.backgroundColor = .black
        myButton.layer.cornerRadius = 10
        
        //myButton.clipsToBounds = true
    }


    @IBAction func onClickButton(_ sender: UIButton) {
        myButton.setTitle("버튼이 클릭", for: .normal)
    }
}

