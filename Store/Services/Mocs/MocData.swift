//
//  MocData.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import Foundation

struct MOC {
    static let CHECKOUT_RULES_SAMPLE_1 = [BuyOneGetOnePricingRule(products: [.FR1]), LotBuyPricingRule(products: [.SR1], discountAmount: 0.50)]
    static let CHECKOUT_SERVICE_SAMPLE_2 = [BuyOneGetOnePricingRule(products: [.FR1]), LotBuyPricingRule(products: [.SR1], discountAmount: 0.50), LotBuyPricingRule(products: [.CF1, .FR1], discountAmount: 1.50)]
    static let PRODUCT_FR1_WITH_ONE_FOR_ONE_DISCOUNT = FR1(discountType: .OneForOne)
    static let PRODUCT_SR1_WITH_LOT_BUY_DISCOUNT = SR1(discountType: .LotBuy(discount: 0.50))
    static let PRODUCT_FR1 = FR1()
    static let PRODUCT_SR1 = SR1()
    static let PRODUCT_CF1 = CF1()
}
