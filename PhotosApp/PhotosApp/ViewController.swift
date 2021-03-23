//
//  ViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/22.
//

import UIKit
import Photos

class ViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var mainCollectionView: UICollectionView!
    var allPhotos: PHFetchResult<PHAsset>?
    var thumbnailSize: CGSize = CGSize(width: 100, height: 100)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
        let nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        mainCollectionView.register(nibName, forCellWithReuseIdentifier: "CollectionViewCell")
        self.allPhotos = PHAsset.fetchAssets(with: .image, options: .none)
        self.mainCollectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        if let asset = self.allPhotos?[indexPath.item] {
            LocalImageManager.shared.requestImage(with: asset, thumbnailSize: self.thumbnailSize, completion: {image in cell.configure(with: image)})
        }
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

class LocalImageManager {
    static var shared = LocalImageManager()
    fileprivate let imageManager = PHCachingImageManager()
    var representIdentifier: String?
    var size: CGSize = CGSize(width: 100, height: 100)
    
    func requestImage(with asset: PHAsset?, thumbnailSize: CGSize, completion: @escaping (UIImage?) -> Void) {
        guard let asset = asset else { completion(nil)
            return
        }
        self.representIdentifier = asset.localIdentifier
        self.imageManager.requestImage(for: asset, targetSize: size, contentMode: .aspectFit, options: .none, resultHandler: {image, info in completion(image)
        })
    }
}

