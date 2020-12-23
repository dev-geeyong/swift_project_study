//
//  SecondViewController.swift
//  SimpleTableView
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var scondLabel: UILabel!
    var dataTest: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scondLabel.text = dataTest
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
