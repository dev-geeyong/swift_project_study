//
//  AlbumCollectionViewCell.swift
//  Myalbum2
//
//  Created by dev.geeyong on 2020/12/29.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var PhotoView: UIImageView!
    @IBOutlet var AlbumTitle: UILabel!
    
    @IBOutlet var AlbumCount: UILabel!
    
    override func prepareForReuse() {
      super.prepareForReuse()
      AlbumTitle.text = "Untitled"
      AlbumCount.text = "0 photos"
      PhotoView.image = nil
      PhotoView.isHidden = true
    }
    func update(title: String?, count: Int) {
        AlbumTitle.text = title ?? "Untitled"
      AlbumCount.text = "\(count.description) \(count == 1 ? "photo" : "photos")"
    }
}
