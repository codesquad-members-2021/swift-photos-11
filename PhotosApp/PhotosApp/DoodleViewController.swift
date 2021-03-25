//
//  DoodleViewController.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/24.
//

import UIKit

class DoodleViewController: UIViewController {

    @IBOutlet weak var doodleCollectionView: UICollectionView!
    private var pictures: [Picture]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.doodleCollectionView.delegate = self
        self.doodleCollectionView.dataSource = self
        self.doodleCollectionView.register(DoodleCell.nib(), forCellWithReuseIdentifier: DoodleCell.identifier)
        
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "doodle", withExtension: "json")!
        
        guard let data = try? Data(contentsOf: url),
              let picture = try? decoder.decode([Picture].self, from: data) else {
            return
        }
        pictures = picture
    }
}

extension DoodleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.doodleCollectionView.dequeueReusableCell(withReuseIdentifier: DoodleCell.identifier, for: indexPath) as? DoodleCell else {
            return UICollectionViewCell()
        }
        DispatchQueue.main.async {
            let url = URL(string: "\(self.pictures[indexPath.item].image)")
            let data = try? Data(contentsOf: url!)
            cell.configure(with: UIImage(data: data!))
        }
        return cell
    }
}
extension DoodleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 50)
    }
}
