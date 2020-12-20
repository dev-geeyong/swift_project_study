//
//  ViewController.swift
//  IOSstudy1220
//
//  Created by dev.geeyong on 2020/12/20.
//

import UIKit
import Toast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toastTest(_ sender: Any) {
        self.view.makeToast("This is a piece of toast", duration: 3.0, position: .top)

    }
    
}

