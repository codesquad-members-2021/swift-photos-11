//
//  DoodleCell.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/24.
//

import UIKit

class DoodleCell: UICollectionViewCell {
    static let identifier = "DoodleCell"

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }
    func configure(with image: UIImage?) {
        self.imageView.image = image
    }

}
