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
    let imageManager = PHCachingImageManager()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.shared().register(self)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        requestImage()
        self.mainCollectionView.reloadData()
    }
    
    //MARK: - fetchAssets 메소드
    func requestImage() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        self.allPhotos = PHAsset.fetchAssets(with: fetchOptions)
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let asset: PHAsset = allPhotos!.object(at: indexPath.row)
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil, resultHandler: {image, _ in cell.cellImageView.image = image})
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 10
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

extension ViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        if let changed = changeInstance.changeDetails(for: allPhotos!){
            allPhotos = changed.fetchResultAfterChanges
        }
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
}
