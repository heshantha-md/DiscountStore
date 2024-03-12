//
//  CheckoutService.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import Foundation

final class CheckoutService: ObservableObject {
    // MARK: - PROPERTIES
    @Published var cart: Products = []
    private var pricingRules: PricingRules?
    
    // MARK: - INITIALIZERS
    init(rules: PricingRules) {
        self.pricingRules = rules
    }
    
    // MARK: - FUNCTIONS
    @MainActor
    func scan(_ product: ProductProtocol) async {
        cart.append(product)
    }
    
    @MainActor
    func remove(_ product: ProductProtocol) async {
        cart.removeAll(where: { $0.id == product.id })
    }
    
    @MainActor
    func total() async throws -> Float {
        if cart.isEmpty {
            throw ViewError.emptyBucket
        }
        for rule in pricingRules ?? [] {
            try await rule.calculateDiscount(products: &cart)
        }
        return cart.reduce(0) { $0 + $1.netPrice }
    }
}
