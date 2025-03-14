//
//  Image.swift
//  diplom_1
//
//  Created by Сергей Недведский on 19.01.25.
//

import Foundation

final class Image: Codable {
    let imageName: String
    var isFavorite = false
    
    init(imageName: String, isFavorite: Bool = false) {
        self.imageName = imageName
        self.isFavorite = isFavorite
    }
}
