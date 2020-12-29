//
//  AlbumCollectionViewCell.swift
//  MyAlbum
//
//  Created by dev.geeyong on 2020/12/29.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var albumImage: UIImageView!
    
    @IBOutlet var albumTitle: UILabel!
    
    @IBOutlet var albumNumber: UILabel!
    func setup(with movie: Movie) {
        albumImage.image = movie.image
        albumTitle.text = movie.title
        }
}
