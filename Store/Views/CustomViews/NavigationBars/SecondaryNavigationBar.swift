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
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: dismiss) {
                Image(systemName: "arrow.left")
            }
            .font(.system(.title, weight: .semibold))
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(Circle())
            .modifier(AppShadow(color: Colors.SHADOW_COLOR))
            
            Spacer()
            
            CartButton(action: {
                isCartViewPresented = !isCartViewPresented
            })
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .font(.title)
        .foregroundStyle(Colors.FONT_COLOR_1)
    }
}

// MARK: - PREVIEW
#Preview {
    SecondaryNavigationBar(dismiss: { /* DISMISS ACTION */ },
                           isCartViewPresented: .constant(false))
}
