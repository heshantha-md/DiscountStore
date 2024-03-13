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
                BackgroundSymbolsView(image: Image("bg1"),
                                      geometry: geo)
                                     .blur(radius: 0.8)
                
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
                    .modifier(AppShadow())
                    
                    // MARK: - NAME & PRICE
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text(product.grossPrice.asPrice)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                    }
                    .font(.system(.title, weight: .light))
                    .foregroundStyle(Colors.FONT_COLOR_WHITE)
                    .padding(.top, 10)
                    
                    // MARK: - DESCRIPTION
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Constants.STRING.DESCRIPTION)
                                .font(.system(.headline, weight: .bold))
                            Text(Constants.STRING.LORM_TEXT)
                                .fontWeight(.light)
                        }
                        .foregroundStyle(Colors.FONT_COLOR_1)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(rect)
                    .modifier(AppShadow())
                    
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
