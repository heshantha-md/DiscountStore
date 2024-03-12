//
//  StoreApp.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import SwiftUI

@main
struct StoreApp: App {
    // MARK: - PROPERTIES
    @StateObject var productService = MocProductsService()
    @StateObject var favoriteService = FavouritesService()
    @StateObject var checkoutService = CheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1)
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
        .environmentObject(productService)
        .environmentObject(favoriteService)
        .environmentObject(checkoutService)
    }
}
