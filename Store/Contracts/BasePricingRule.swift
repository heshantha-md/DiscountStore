//
//  BasePricingRule.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

class BasePricingRule: PricingRule {
    // MARK: - PROPERTIES
    var dicountedProducts: Set<ProductCode>
    
    // MARK: - INITIALIZERS
    init(products: Set<ProductCode>) {
        self.dicountedProducts = products
    }
    
    // MARK: - FUNCTIONS
    func calculateDiscount(products: inout Products) async throws {
        
    }
}
