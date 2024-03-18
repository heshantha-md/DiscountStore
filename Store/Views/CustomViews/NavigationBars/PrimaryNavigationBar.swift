//
//  PrimaryNavigationBar.swift
//  Store
//
//  Created by Heshantha Don on 14/03/2024.
//

import SwiftUI

struct PrimaryNavigationBar: View {
    // MARK: - PROPERTIES
    @Environment(\.colorScheme) var colorScheme
    @Binding var isCartViewPresented: Bool
    
    // MARK: - BODY
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image("dp")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .background {
                        Circle()
                            .stroke(Colors.FONT_COLOR_1, lineWidth: 6)
                    }
                
                VStack(alignment: .leading) {
                    Text(colorScheme == .light ? Constants.STRING.GOOD_MORNING : Constants.STRING.GOOD_EVENING + ",")
                        .font(.system(.callout, weight: .heavy))
                    Text("Heshantha")
                        .font(.system(size: 30, weight: .ultraLight))
                }
            }
            .padding(.horizontal, 13)
            .padding(.trailing, 20)
            .padding(.vertical, 11)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
            .modifier(AppShadow(color: Colors.SHADOW_COLOR))
            
            Spacer()
            
            CartButton(action: { isCartViewPresented.toggle() })
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .foregroundStyle(Colors.FONT_COLOR_1)
    }
}

// MARK: - PREVIEW
#Preview {
    PrimaryNavigationBar(isCartViewPresented: .constant(false))
}
