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
    @IBOutlet var thirdButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var progressVar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    @IBAction func touchUpButton(_ sender: UIButton) {
        
        
        let textLabelBool = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(textLabelBool)
     
        
        if userGotItRight  {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
          
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI(){
        let choiceText = quizBrain.choiceText()
        trueButton.setTitle(choiceText[0], for: .normal)
        thirdButton.setTitle(choiceText[1], for: .normal)
        falseButton.setTitle(choiceText[2], for: .normal)
        questionLabel.text = quizBrain.questionText()
        progressVar.progress = quizBrain.setProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
   
        
       
    }
}

