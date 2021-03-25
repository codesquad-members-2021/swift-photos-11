//
//  CollectionViewCell.swift
//  PhotosApp
//
//  Created by sonjuhyeong on 2021/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleToFill
    }
    
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(with image: UIImage?) {
        self.imageView.image = image
    }
    
}
