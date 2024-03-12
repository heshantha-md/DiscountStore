//
//  DisplayImage.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import Foundation

struct DisplayImage {
    // MARK: - PROPERTIES
    let thumbnail: String
    let backgroundImage: String
    
    // MARK: - INITIALIZERS
    init(thumbnail: String, backgroundImage: String) {
        self.thumbnail = thumbnail
        self.backgroundImage = backgroundImage
    }
}
