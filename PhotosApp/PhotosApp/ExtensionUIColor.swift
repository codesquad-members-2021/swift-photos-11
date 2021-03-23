//
//  ExtensionUIColor.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/23.
//

import UIKit

extension UIColor {
    static func random() -> UIColor{
        return UIColor(red: CGFloat.random(in: 0...1),
                       green: CGFloat.random(in: 0...1),
                       blue: CGFloat.random(in: 0...1),
                       alpha: 1)
    }
}
