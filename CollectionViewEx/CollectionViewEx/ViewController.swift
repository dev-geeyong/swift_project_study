//
//  ViewController.swift
//  CollectionViewEx
//
//  Created by dev.geeyong on 2020/12/28.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //var numberOfCell: Int = 10
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.friends.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: FriendsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! FriendsCollectionViewCell
        
        let friend: Friend = self.friends[indexPath.item]
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAddress
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        collectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }
        catch{
            print(error.localizedDescription)
        }
        self.collectionView.reloadData()
    }


}

