//
//  CF1.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

struct CF1: Identifiable, ProductProtocol {
    // MARK: - PROPERTIES
    var id: String = UUID().uuidString
    var code: ProductCode = .CF1
    var name: String = "Coffee"
    var grossPrice: Float = 11.23
    var discount: Float = 0
    var netPrice: Float {
        return grossPrice - discount
    }
    var displayImage: DisplayImage = DisplayImage(thumbnail: "https://www.transparentpng.com/thumb/coffee/Vlg8de-coffee-mug.png",
                                                  backgroundImage: "https://neurosciencenews.com/files/2023/06/coffee-brain-caffeine-neuroscincces.jpg")
    //"https://static.vecteezy.com/system/resources/thumbnails/029/283/851/small/coffee-coffee-cup-coffee-cup-coffee-cup-clipart-restaurant-coffee-cup-transparent-background-ai-generative-free-png.png"
    var discountType: DiscountType = .None
}
