//
//  ImageCollectionViewCell.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with image: UIImage?) {
        self.imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil)
    }

}
