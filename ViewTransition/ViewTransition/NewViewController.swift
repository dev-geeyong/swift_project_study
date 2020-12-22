//
//  NewViewController.swift
//  ViewTransition
//
//  Created by dev.geeyong on 2020/12/21.
//

import UIKit

class NewViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
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
