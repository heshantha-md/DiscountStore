//
//  CheckoutService.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import Foundation

class CheckoutService: ObservableObject {
    // MARK: - PROPERTIES
    @Published var cart: Products = []
    fileprivate var pricingRules: PricingRules?
    
    // MARK: - INITIALIZERS
    init(rules: PricingRules) {
        self.pricingRules = rules
    }
    
    // MARK: - FUNCTIONS
    @MainActor
    final func scan(_ product: ProductProtocol) async {
        cart.append(product)
        await self.calculateDiscounts()
    }
    
    @MainActor
    final func remove(_ product: ProductProtocol) async {
        cart.removeAll(where: { $0.id == product.id })
        await self.calculateDiscounts()
    }
    
    @MainActor
    final func totalNetPrice() async throws -> Float {
        if cart.isEmpty {
            throw ViewError.emptyBucket
        }
        return cart.reduce(0) { $0 + $1.netPrice }
    }
    
    @MainActor
    final func totalGrossPrice() async throws -> Float {
        if cart.isEmpty {
            throw ViewError.emptyBucket
        }
        return cart.reduce(0) { $0 + $1.grossPrice }
    }
    
    @MainActor
    final func totalDiscountsPrice() async throws -> Float {
        if cart.isEmpty {
            throw ViewError.emptyBucket
        }
        return cart.reduce(0) { $0 + $1.discount }
    }
    
    @MainActor
    final func calculateDiscounts() async {
        if cart.isEmpty {
            return
        }
        for rule in pricingRules ?? [] {
            do {
                try await rule.calculateDiscount(products: &cart)
            } catch {
                print("Error when calculate discount \(error.localizedDescription)")
            }
        }
    }
}

final class MocCheckoutService: CheckoutService {
    // MARK: - INITIALIZERS
    override init(rules: PricingRules) {
        super.init(rules: rules)
        self.cart = [SR1(discountType: .LotBuy(discount: 0.50)), SR1(discountType: .LotBuy(discount: 0.50)), SR1(discountType: .LotBuy(discount: 0.50)), FR1(discountType: .OneForOne), FR1(discountType: .OneForOne), CF1()]
    }
}
