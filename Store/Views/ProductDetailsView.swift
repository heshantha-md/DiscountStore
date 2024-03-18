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
    @Environment(\.dismiss) var dismiss
    @State var product: ProductProtocol
    @Binding var isCartViewPresented: Bool
    @State private var productImage: Image? = nil
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            let rect = RoundedRectangle(cornerRadius: 10)
            
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    // MARK: - NAVIGATION BAR
                    SecondaryNavigationBar(dismiss: { dismiss() },
                                           isCartViewPresented: $isCartViewPresented)
                    
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
                    
                    // MARK: - NAME & PRICE
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text(product.grossPrice.asPrice)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                    }
                    .font(.system(size: 25, weight: .light))
                    .foregroundStyle(Colors.FONT_COLOR_1)
                }
                .offset(y: isAnimating ? .zero : -(geo.size.height / 4))
                
                VStack(spacing: 15) {
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
                    
                    MainButton(title: Constants.STRING.ADD_TO_CART,
                               action: {
                        Task {
                            await checkoutService.scan(product)
                        }
                    })
                }
                .offset(y: isAnimating ? .zero : geo.size.height / 4)
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.ultraThinMaterial) // MARK: - BACKGROUND
            .background(Colors.BACKGROUND_COLOR
                .ignoresSafeArea())
        }
        .toolbar(.hidden)
        .task {
            await MainActor.run {
                withAnimation {
                    isAnimating = true
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ProductDetailsView(product: FR1(), isCartViewPresented: .constant(false))
        .environmentObject(CheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1))
}
