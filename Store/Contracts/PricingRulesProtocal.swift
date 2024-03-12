//
//  PricingRulesProtocal.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import Foundation

protocol PricingRule {
    // MARK: - PROPERTIES
    func calculateDiscount(products: inout Products) async throws
}
