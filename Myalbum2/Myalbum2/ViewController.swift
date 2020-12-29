//
//  ViewController.swift
//  Myalbum2
//
//  Created by dev.geeyong on 2020/12/29.
//

import UIKit
import Photos

class ViewController: UIViewController {

    private var allPhotos = PHFetchResult<PHAsset>()
    var sections: [AlbumCollectionSectionType] = [.all]
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
      super.viewDidLoad()
      
        collectionView.dataSource = self
      getPermissionIfNecessary { granted in
        guard granted else { return }
        self.fetchAssets()
        
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
    func getPermissionIfNecessary(completionHandler: @escaping (Bool) -> Void) {
      // 1
      guard PHPhotoLibrary.authorizationStatus() != .authorized else {
        completionHandler(true)
        return
      }
      // 2
      PHPhotoLibrary.requestAuthorization { status in
        completionHandler(status == .authorized)
      }

    }

    func fetchAssets() {
      
      // 1
      let allPhotosOptions = PHFetchOptions()
      allPhotosOptions.sortDescriptors = [
        NSSortDescriptor(
          key: "creationDate",
          ascending: false)
      ]
      // 2
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        
    }

}
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as! AlbumCollectionViewCell
        let coverAsset: PHAsset?
        let sectionType = sections[indexPath.section]
        
        coverAsset = allPhotos.firstObject
        cell.update(title: sectionType.description, count: allPhotos.count)
        
        guard let asset = coverAsset else { return cell }
        cell.PhotoView.fetchImageAsset(asset, targetSize: cell.bounds.size) { success in
          cell.PhotoView.isHidden = !success
        }
        
        return cell
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}

