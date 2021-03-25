//
//  DoodleCollectionViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/25.
//

import UIKit

private let reuseIdentifier = "Cell"

class DoodleCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var pictures: [Picture]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView!.register(DoodleCell.nib(), forCellWithReuseIdentifier: DoodleCell.identifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: DoodleCell.identifier, for: indexPath) as? DoodleCell else {
                return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 50)
    }
}
