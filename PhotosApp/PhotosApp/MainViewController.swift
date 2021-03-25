//
//  ViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/22.
//

import UIKit
import Photos

class MainViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var mainCollectionView: UICollectionView!
    private var allPhotos: PHFetchResult<PHAsset>?
    private let imageManager = PHCachingImageManager()
    private let thumbnailSize = CGSize(width: 100, height: 100)
    
    private var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        PHPhotoLibrary.shared().register(self)
        requestImage()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        self.mainCollectionView.reloadData()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(viewDoodleView))
    }
    
    //MARK: - fetchAssets 메소드
    func requestImage() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        self.allPhotos = PHAsset.fetchAssets(with: fetchOptions)
    }
    
    @objc func viewDoodleView() {
        self.present(delegate.navigationController, animated: true, completion: nil)
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        if let asset = self.allPhotos?[indexPath.item] {
                   imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: .none, resultHandler: { (image, _) in
                       cell.configure(with: image)
                   })
               }
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 10
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}

extension MainViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        if let changed = changeInstance.changeDetails(for: allPhotos!){
            allPhotos = changed.fetchResultAfterChanges
        }
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
}
