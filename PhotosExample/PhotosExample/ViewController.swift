//
//  ViewController.swift
//  PhotosExample
//
//  Created by dev.geeyong on 2020/12/28.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver {

    @IBOutlet weak var tableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>! //PHAsset, PHAssetCollection, PHCollectionList
    //PHAsset - 사진 라이브러리의 이미지, 비디오, 라이브 포토를 나타냅니다.
    //PHFetchResult 가져오기 메서드에서 반환된 에셋 또는 컬렉션의 정렬된 목록입니다.
    @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem){
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    //PHCachingImageManager 많은 에셋을 일괄적으로 미리 로딩하기 위해 최적화된 에셋과 관련된 섬네일 및 전체 크기의 이미지 또는 비디오 데이터를 검색하거나 생성하는 방법을 제공합니다.
    let cellIdentifier: String = "cell"
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }//편집가능
      
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let asset: PHAsset = self.fetchResult[indexPath.row]
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([asset] as NSArray)
            }, completionHandler: nil)
        }
    }
    func requestCollection(){
        
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let cameraRollcollection = cameraRoll.firstObject else {
            return
        }
        //PHFetchOptions 에셋 또는 컬렉션 객체를 가져올 때 Photos에서 반환하는 결과에 필터링, 정렬 등 영향을 주는 옵션입니다.
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollcollection, options: fetchOptions)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        //PHPhotoLibrary 객체를 사용하여 사진 콘텐츠에 접근하고, 에셋 및 컬렉션을 변경할 수 있도록 애플리케이션의 사용자 권한을 얻습니다. 권한을 얻으면 사진 라이브러리가 변경될 때 변경사항을 전달받을 수도 있습니다.
        //사용자의 사진 라이브러리에 대한 접근 및 변경을 관리하는 공유 객체입니다.
        
        switch photoAurhorizationStatus {
        case .authorized:
            print("authorized")
            self.requestCollection()
            self.tableView.reloadData()
        case .denied:
            print("denied")
        case .notDetermined:
            print("not Deter mained")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status{
                case .authorized:
                    print("authorized")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                    
                case .denied:
                    print("denied")
                default: break
                }
                
            })
        case .restricted:
            print("restricted")
        default:
            break
        }
        PHPhotoLibrary.shared().register(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 150, height: 150), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in
            cell.imageView?.image = image
        })
        return cell
    }
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult) else{return}
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: ImageZoomViewController = segue.destination as? ImageZoomViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        nextViewController.asset = self.fetchResult[index.row]
        
    }
    


}

