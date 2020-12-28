//
//  ViewController.swift
//  AsyncExample
//
//  Created by dev.geeyong on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clickButton(_ sender: Any) {
        
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg")
        else{return}
        do{
            OperationQueue().addOperation {
                let imageData: Data = try! Data.init(contentsOf: imageURL)
                guard let image: UIImage = UIImage(data: imageData)else{return}
                
                OperationQueue.main.addOperation {
                    self.imageView.image = image
                }
               
            }
            
        }
        catch{
            return
            
        }
        
        
        
    }
}

