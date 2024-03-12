//
//  LotBuyPricingRule.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import Foundation

class LotBuyPricingRule: BasePricingRule {
    // MARK: - PROPERTIES
    var discountAmount: Float = 0
    
    // MARK: - INITIALIZERS
    init(products: Set<ProductCode>, discountAmount: Float) {
        super.init(products: products)
        self.discountAmount = discountAmount
    }
    
    // MARK: - FUNCTIONS
    override func calculateDiscount(products: inout Products) async throws {
        try await super.calculateDiscount(products: &products)
        
        if discountAmount > 0 {
            dicountedProducts.forEach { code in
                if products.filter({ $0.code == code }).count >= 3 {
                    products = products.map { product -> ProductProtocol in
                        var mutableProduct = product
                        if product.code == code {
                            applyDiscount(&mutableProduct)
                        }
                        return mutableProduct
                    }
                }
            }
        }
    }
    
    private func applyDiscount(_ product: inout ProductProtocol) {
        switch product.code {
        default:
            product.discount = discountAmount
        }
    }
}
