//
//  LoadImageManager.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/25.
//

import UIKit

class ImageManager {
    private var pictures: [Picture] = []
    
    func decodeJSON() {
        
        let decoder = JSONDecoder()
        
        guard let url = Bundle.main.url(forResource: "doodle", withExtension: "json") else {
            return
        }

        guard let data = try? Data(contentsOf: url),
              let picture = try? decoder.decode([Picture].self, from: data) else {
            return
        }
        pictures = picture
        
    }
    
    func loadImage(indexPath: Int) -> UIImage? {
        guard let url = URL(string: "\(pictures[indexPath].image)"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    func count() -> Int {
        return pictures.count
    }
}
