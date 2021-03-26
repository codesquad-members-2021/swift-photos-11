//
//  DoodleCell.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/25.
//

import UIKit

class DoodleCell: UICollectionViewCell {

    static let identifier = "DoodleCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressTouched))
        longPressGestureRecognizer.minimumPressDuration = 0.5
        self.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func longPressTouched(_ sender: UILongPressGestureRecognizer) {
        self.becomeFirstResponder()
        let menuItem = UIMenuItem(title: "Save", action: #selector(saveImage))
        UIMenuController.shared.menuItems = [menuItem]
        UIMenuController.shared.showMenu(from: self, rect: self.bounds)
    }
    
    @objc func saveImage() {
        
    }
    
    static let nib = {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(with image: UIImage?) {
        self.imageView.image = image
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(saveImage)
    }

}
