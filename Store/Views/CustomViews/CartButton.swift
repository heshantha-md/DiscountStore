//
//  CartButton.swift
//  Store
//
//  Created by Heshantha Don on 18/03/2024.
//

import SwiftUI

struct CartButton: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var checkoutService: CheckoutService
    var action: () -> Void
    var shadowColor: Color
    
    // MARK: - BODY
    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: "cart.fill")
                .overlay(alignment: .topTrailing) {
                    Text("\(checkoutService.cart.count)")
                        .font(.system(.caption, weight: .heavy))
                        .padding(5)
                        .background(.red)
                        .clipShape(Circle())
                        .offset(y: -5)
                        .foregroundStyle(.white)
                        .opacity(checkoutService.cart.count > 0 ? 1 : 0)
                }
        })
        .font(.system(.title, weight: .semibold))
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(Circle())
        .modifier(AppShadow(color: shadowColor))
    }
}

// MARK: - PREVIEW
#Preview {
    CartButton(action: {
        // DO SOMETHING HERE
    }, shadowColor: .black)
    .environmentObject(MocCheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1) as! CheckoutService)
}
