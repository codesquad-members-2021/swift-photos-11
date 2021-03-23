//
//  CollectionViewCell.swift
//  PhotosApp
//
//  Created by sonjuhyeong on 2021/03/23.
//

import UIKit
import Photos

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    private let randomColor: UIColor = {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.cellImageView.contentMode = .scaleAspectFill
    }
    
    func configure(with image: UIImage?) {
        self.cellImageView.image = image
    }
    
}
