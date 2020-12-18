//
//  ViewController.swift
//  trainingImageView
//
//  Created by dev.geeyong on 2020/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var iconPlus: UIImageView!
    @IBOutlet var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.image = UIImage(named: "1.JPG")
        myImage.contentMode = .scaleToFill
        iconPlus.image = UIImage(named: "refresh.png")
    }

    @IBAction func clickButton(_ sender: UIButton) {
    
        myImage.image = UIImage(named: "3.JPG")
    }
    
}

