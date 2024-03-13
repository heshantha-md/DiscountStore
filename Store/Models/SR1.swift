//
//  SR1.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

struct SR1: Identifiable, ProductProtocol {
    // MARK: - PROPERTIES
    var id: String = UUID().uuidString
    var code: ProductCode = .SR1
    var name: String = "Strawberrie"
    var grossPrice: Float = 5.00
    var discount: Float = 0
    var netPrice: Float {
        return grossPrice - discount
    }
    var displayImage: DisplayImage = DisplayImage(thumbnail: "https://static.vecteezy.com/system/resources/previews/022/430/955/original/strawberry-cut-out-red-strawberry-on-transparent-background-png.png",
                                                  backgroundImage: "https://hips.hearstapps.com/clv.h-cdn.co/assets/15/22/1432664914-strawberry-facts1.jpg?resize=980:*")
    var discountType: DiscountType = .None
}
