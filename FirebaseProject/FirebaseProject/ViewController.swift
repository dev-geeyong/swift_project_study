//
//  ViewController.swift
//  FirebaseProject
//
//  Created by dev.geeyong on 2020/12/28.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }


}

