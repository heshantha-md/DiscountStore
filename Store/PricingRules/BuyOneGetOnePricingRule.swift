//
//  BuyOneGetOnePricingRule.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import Foundation

class BuyOneGetOnePricingRule: BasePricingRule {
    // MARK: - FUNCTIONS
    override func calculateDiscount(products: inout Products) async throws  {
        try await super.calculateDiscount(products: &products)
        
        dicountedProducts.forEach { code in
            var count = products.filter { $0.code == code }.count
            if count > 1 {
                count = (count % 2 == 0 ? count : count - 1) / 2
                products = products.map { item -> ProductProtocol in
                    var mutableItem = item
                    if count > 0, item.code == code {
                        mutableItem.discount = mutableItem.grossPrice
                        count -= 1
                    }
                    return mutableItem
                }
                
            }
        }
    }
}
