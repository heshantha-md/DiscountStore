//
//  FR1.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

struct FR1: Identifiable, ProductProtocol {
    // MARK: - PROPERTIES
    var id: String = UUID().uuidString
    var code: ProductCode = .FR1
    var name: String = "Fruit tea"
    var grossPrice: Float = 3.11
    var discount: Float = 0
    var netPrice: Float {
        return grossPrice - discount
    }
    var displayImage: DisplayImage = DisplayImage(thumbnail: "https://pngimg.com/d/tea_PNG98912.png",
                                                  backgroundImage: "https://www.royalcupcoffee.com/sites/default/files/images/blog_post/shutterstock_417937765_0.jpg")
    var discountType: DiscountType = .None
}
