//
//  CollectionViewCell.swift
//  PhotosApp
//
//  Created by sonjuhyeong on 2021/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "rectangleCell"
   
    private let randomColor: UIColor = {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }()
    
//    private let pictureView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: <#T##String#>)
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = randomColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }}
