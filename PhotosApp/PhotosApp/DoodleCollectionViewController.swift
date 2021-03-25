//
//  DoodleCollectionViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/25.
//

import UIKit

class DoodleCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var imageManager: ImageManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageManager()
        setCollectionView()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageManager.count()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: DoodleCell.identifier, for: indexPath) as? DoodleCell else{
            return UICollectionViewCell()
        }
        
        DispatchQueue.global().async {
            let image = self.imageManager.loadImage(indexPath: indexPath.item)
            DispatchQueue.main.async {
                cell.configure(with: image)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 50)
    }
    
    func setCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView!.register(DoodleCell.nib(), forCellWithReuseIdentifier: DoodleCell.identifier)
        self.title = "Doodle"
        self.collectionView.backgroundColor = .systemGray2
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTouched))
    }
    
    func setImageManager() {
        imageManager = ImageManager()
        imageManager.decodeJSON()
    }
    
    @objc func closeButtonTouched() {
        self.dismiss(animated: true, completion: nil)
    }
}
