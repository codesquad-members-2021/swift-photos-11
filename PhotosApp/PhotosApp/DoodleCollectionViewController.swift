//
//  DoodleCollectionView.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/25.
//

import UIKit

class DoodleCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private var pictures: [Picture]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .systemGray2
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.title = "Doodle"
        self.collectionView.register(DoodleCell.nib(), forCellWithReuseIdentifier: DoodleCell.identifier)
        self.navigationItem.rightBarButtonItem?.title = "close"
        pictures = decodeJSON()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DoodleCell.identifier, for: indexPath) as? DoodleCell else {
            return UICollectionViewCell()
        }
        
        DispatchQueue.main.async {
            let url = URL(string: "\(self.pictures[indexPath.item].image)")
            let data = try? Data(contentsOf: url!)
            cell.configure(with: UIImage(data: data!))
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 50)
    }
    
    func decodeJSON() -> [Picture]?{
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "doodle", withExtension: "json")!
        
        guard let data = try? Data(contentsOf: url),
              let picture = try? decoder.decode([Picture].self, from: data) else {
            return nil
        }
        return picture
    }
}
