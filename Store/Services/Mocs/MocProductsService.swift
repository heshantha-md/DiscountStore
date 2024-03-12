//
//  MocProductsService.swift
//  Store
//
//  Created by Heshantha Don on 10/03/2024.
//

import Foundation

final class MocProductsService: ObservableObject {
    // MARK: - PROPERTIES
    @Published var data: Products = []
    
    // MARK: - FUNCTIONS
    @MainActor
    func fetchData() async throws {
        data = [MOC.PRODUCT_FR1_WITH_ONE_FOR_ONE_DISCOUNT, MOC.PRODUCT_SR1_WITH_LOT_BUY_DISCOUNT, CF1()]
    }
}
