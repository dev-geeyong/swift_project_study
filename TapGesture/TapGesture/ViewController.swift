//
//  ViewController.swift
//  TapGesture
//
//  Created by dev.geeyong on 2020/12/22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBAction func tapView (_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//        self.view.addGestureRecognizer(tapGesture) //코드로 넣기..
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
        //델리게이트 활용해보기
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
    


}

