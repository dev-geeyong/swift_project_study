//
//  ImageZoomViewController.swift
//  PhotosExample
//
//  Created by dev.geeyong on 2020/12/28.
//

import UIKit
import Photos

class ImageZoomViewController: UIViewController, UIScrollViewDelegate {

    var asset: PHAsset! //전화면에서 받아올..
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageManager.requestImage(for: asset ,
                                  targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: {image, _ in
                                    self.imageView.image = image
                                  })

        // Do any additional setup after loading the view.
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
