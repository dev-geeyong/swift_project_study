//
//  MovieViewController.swift
//  githubconnect
//
//  Created by dev.geeyong on 2020/12/13.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var thirdImageView: UIImageView!
    
    //화면이 보이기 전에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.layer.cornerRadius = 20
        firstImageView.layer.borderColor = UIColor.red.cgColor
        firstImageView.layer.borderWidth = 3

        secondImageView.layer.cornerRadius = 20
        secondImageView.layer.borderColor = UIColor.red.cgColor
        secondImageView.layer.borderWidth = 3
        
        thirdImageView.layer.cornerRadius = 20
        thirdImageView.layer.borderColor = UIColor.red.cgColor
        thirdImageView.layer.borderWidth = 3
        
    }
    
}
