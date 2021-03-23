//
//  ViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/22.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    private var allPhotos: PHFetchResult<PHAsset>?
    private var imageManager: PHCachingImageManager!
    private var thumbnailSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainCollectionView.register(ImageCollectionViewCell.nib(),
                                         forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        
        self.allPhotos = PHAsset.fetchAssets(with: .image, options: .none)
        self.imageManager = PHCachingImageManager()
        self.mainCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let asset = self.allPhotos?[indexPath.item] {
            imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: .none, resultHandler: { (image, info) in
                cell.configure(with: image)
            })
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return thumbnailSize
    }
}

