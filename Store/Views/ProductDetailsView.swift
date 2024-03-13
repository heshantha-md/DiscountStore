//
//  ProductDetailsView.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import SwiftUI

struct ProductDetailsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var checkoutService: CheckoutService
    @State var product: ProductProtocol
    @State var productImage: Image? = nil
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: - BACKGROUND SYMBOLS
                BackgroundSymbolsView(geometry: geo)
                
                let rect = RoundedRectangle(cornerRadius: 10)
                
                VStack {
                    // MARK: - DISPLAY IMAGE
                    AsyncImage(url: URL(string: product.displayImage.backgroundImage)) { phase in
                        switch phase {
                        case .empty:
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .overlay {
                                    ProgressView()
                                }
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .onAppear() {
                                    self.productImage = image
                                }
                                .clipShape(rect)
                        default:
                            EmptyView()
                        }
                    }
                    .frame(minWidth: (geo.size.width - 35), minHeight: 250, maxHeight: 300)
                    .clipShape(rect)
                    .modifier(DiscountLabel(product: product)) // MARK: - DISCOUNT LABELS
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
                    
                    // MARK: - NAME & PRICE
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text(product.grossPrice.asPrice)
                    }
                    .font(.system(.title, weight: .heavy))
                    .foregroundStyle(Colors.FONT_COLOR_3)
                    .padding(.top, 10)
                    
                    // MARK: - DESCRIPTION
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Constants.STRING.DESCRIPTION)
                                .font(.system(.headline, weight: .heavy))
                            Text(Constants.STRING.LORM_TEXT)
                        }
                        .foregroundStyle(Colors.FONT_COLOR_3)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(rect)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
                    
                    MainButton(title: Constants.STRING.ADD_TO_CART,
                               action: {
                        Task {
                            await checkoutService.scan(product)
                        }
                    })
                }
                .padding(.horizontal, 15)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Colors.BG_GREEN_COLOR) // MARK: - BACKGROUND
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ProductDetailsView(product: FR1())
        .environmentObject(CheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1))
}
