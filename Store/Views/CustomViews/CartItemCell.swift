//
//  CartItemCell.swift
//  Store
//
//  Created by Heshantha Don on 13/03/2024.
//

import SwiftUI

struct CartItemCell: View {
    // MARK: - PROPERTIES
    var index: Int
    @Binding var product: ProductProtocol
    
    // MARK: - BODY
    var body: some View {
        HStack {
            // MARK: - INDEX & NAME
            Text("\(index).")
                .fontWeight(.ultraLight)
            Text("\(product.name)")
                .fontWeight(.regular)
            
            Spacer()
            
            // MARK: - PRICE
            HStack {
                if product.discount > 0 {
                    Text("\(product.grossPrice.asPrice)")
                        .strikethrough(color: .red)
                        .fontWeight(.light)
                    Text("\(product.netPrice.asPrice)")
                        .foregroundStyle(Colors.FONT_COLOR_1)
                } else {
                    Text("\(product.grossPrice.asPrice)")
                }
            }
        }
    }
}

#Preview {
    CartItemCell(index: 1, product: .constant(MOC.PRODUCT_CF1))
        .padding()
}
