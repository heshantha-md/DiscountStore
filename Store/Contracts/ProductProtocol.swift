//
//  ProductProtocol.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

protocol ProductProtocol {
    // MARK: - PROPERTIES
    var id: String { get }
    var code: ProductCode { get }
    var name: String { get }
    var grossPrice: Float { get }
    var discount: Float { get set }
    var netPrice: Float { get }
    var displayImage: DisplayImage { get }
    var discountType: DiscountType { get set }
}
