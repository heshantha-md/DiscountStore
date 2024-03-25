//
//  SecondaryNavigationBar.swift
//  Store
//
//  Created by Heshantha Don on 14/03/2024.
//

import SwiftUI

struct SecondaryNavigationBar: View {
    // MARK: - PROPERTIES
    var dismiss: () -> Void
    @Binding var isCartViewPresented: Bool
    @Binding var isAnimating: Bool
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            HStack {
                Button(action: dismiss) {
                    Image(systemName: "arrow.left")
                }
                .font(.system(.title, weight: .semibold))
                .padding([.bottom, .trailing, .top], 15)
                .clipShape(Circle())
                .modifier(AppShadow(color: .black.opacity(0.5)))
                .offset(x: isAnimating ? 0 : -(geo.size.width))
                
                Spacer()
                
                CartButton(action: {
                    isCartViewPresented = !isCartViewPresented
                }, shadowColor: .black.opacity(0.5))
                .offset(x: isAnimating ? 0 : geo.size.width)
            }
            .font(.title)
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
    }
}

// MARK: - PREVIEW
#Preview {
    SecondaryNavigationBar(dismiss: { /* DISMISS ACTION */ },
                           isCartViewPresented: .constant(false),
                           isAnimating: .constant(true))
        .environmentObject(MocCheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1) as! CheckoutService)
}
