//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let softTime: Float = 3
    let mediumTime: Float = 4
    let hardTime: Float = 8
    var timer: Timer?
    var player: AVAudioPlayer!
    
    @IBOutlet var barProgressView: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    
    var counter: Float = 60
    var secondsPassed: Float = 0
    @IBAction func touchUpEggButton(_ sender: UIButton) {
        
        timer?.invalidate()
        secondsPassed = 0.0
        titleLabel.text = sender.currentTitle!
        
        switch sender.currentTitle! {
        
        case "Soft":
            counter = softTime
        case "Medium":
            counter = mediumTime
        case "Hard":
            counter = hardTime
        default:
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < counter {
            secondsPassed += 1
            barProgressView.progress = secondsPassed / counter
        }
        else{
            timer?.invalidate()
            titleLabel.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
    }
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
