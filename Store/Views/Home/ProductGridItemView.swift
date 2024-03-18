//
//  ProductGridItemView.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct ProductGridItemView: View {
    // MARK: - PROPERTIES
    @State var product: ProductProtocol
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            // MARK: - DISPLAY THUMBNAIL
            AsyncImage(url: URL(string: product.displayImage.thumbnail)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                // MARK: - CELL BACKGROUND SPLASH IMAGE
                Image("bg2")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.3)
            }
            .offset(y: 20)
            
            // MARK: - NAME & PRICE
            HStack(spacing: 0) {
                Text("\(product.name)")
                    .foregroundStyle(Colors.FONT_COLOR_1)
                Spacer(minLength: 3)
                Text(product.grossPrice.asPrice)
                    .foregroundStyle(Colors.FONT_COLOR_2)
            }
            .frame(minHeight: 40)
            .font(.system(.callout, weight: .heavy))
            .padding(.horizontal, 12)
            .background(.ultraThinMaterial)
        }
        .frame(minWidth: 100, maxWidth: .infinity)
        .frame(height: 195)
        .modifier(DiscountLabel(product: product)) // MARK: - DISCOUNT LABELS
        .foregroundColor(.white)
        .background(Colors.BG_COLOR_2.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(13)
        .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 5)
    }
}

// MARK: - PREVIEW
#Preview {
    ProductGridItemView(product: MOC.PRODUCT_CF1)
        .preferredColorScheme(.dark)
}
