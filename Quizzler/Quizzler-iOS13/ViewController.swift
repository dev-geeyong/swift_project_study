//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two is equl to six","True"],
        ["Five - Three is greater than One","True"],
        ["Three + Eight is less than Ten","False"]
    ]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func touchUpButton(_ sender: UIButton) {
        
        let textLabelBool = sender.currentTitle!
        let quizBool = quiz[count][1]
        
        if textLabelBool == quizBool {
            print ("정답")
        }
        else{
            print("땡!")
        }
        if count + 1 < quiz.count{
            count += 1
        }else{
            count = 0
        }
       
        updateUI()
    }
    func updateUI(){
        questionLabel.text = quiz[count][0]
    }
}

