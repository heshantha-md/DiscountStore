//
//  ProductDetailsView.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import SwiftUI

struct ProductDetailsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var favouritesService: FavouritesService
    @EnvironmentObject var checkoutService: CheckoutService
    @State var product: ProductProtocol
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Text(product.name)
            Button {
                Task {
                    await checkoutService.scan(product)
                }
            } label: {
                Text("Scan")
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ProductDetailsView(product: SR1())
        .environmentObject(FavouritesService())
        .environmentObject(CheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1))
}
