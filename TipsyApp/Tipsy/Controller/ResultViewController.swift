//
//  ResultViewController.swift
//  Tipsy
//
//  Created by dev.geeyong on 2021/01/05.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: ViewController {

    
    @IBOutlet var resultPresentation: UILabel!
    @IBOutlet var resultLabel: UILabel!
    var resultNumber: String?
    var resultString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultNumber
        resultPresentation.text = resultString
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButton(_ sender: Any) {
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
