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
            VStack(alignment: .leading, spacing: 15) {
                // MARK: - NAVIGATION BAR
                SecondaryNavigationBar(dismiss: { dismiss() },
                                       isCartViewPresented: $isCartViewPresented, 
                                       isAnimating: $isAnimating)
                
                // MARK: - DISPLAY THUMBNAIL
                ThumbnailImage(url: product.displayImage.thumbnail)
                    .shadow(color: .black, radius: 50, x: 5, y: 5)
                    .modifier(DiscountLabel(product: product)) // MARK: - DISCOUNT LABELS
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: isAnimating)
                
                Group {
                    // MARK: - NAME
                    Text(product.name)
                        .font(.system(.title, weight: .bold))
                    
                    // MARK: - DESCRIPTION
                    ScrollView(.vertical) {
                        Text(Constants.STRING.LORM_TEXT)
                            .font(.system(.headline, weight: .light))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 10)
                }
                .offset(x: isAnimating ? 0 : -(geo.size.width))
                
                HStack {
                    VStack(alignment: .leading) {
                        // MARK: - UNITS
                        Text("Price per \(product.units)")
                            .font(.system(.headline, weight: .semibold))
                        
                        // MARK: - PRICE
                        Text(product.grossPrice.asPrice)
                            .font(.system(size: 45, weight: .ultraLight))
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                    }
                    .offset(x: isAnimating ? 0 : -(geo.size.width))
                    
                    Spacer()
                    
                    // MARK: - ADD TO CART BUTTON
                    Button(action: {}, label: {
                        Image(systemName: "cart.fill.badge.plus")
                            .font(.system(.largeTitle, weight: .semibold))
                            .padding(20)
                            .background(.accent)
                            .foregroundStyle(.black)
                            .clipShape(Circle())
                            .modifier(AppShadow(color: .black))
                    })
                    .padding(.trailing, 10)
                    .offset(x: isAnimating ? 0 : geo.size.width)
                }
            }
            .padding(.horizontal, 15)
            .background(alignment: .bottom) {
                // MARK: - BLACK TEXT BACKGROUND SHADE
                Rectangle()
                    .fill(.black.opacity(0.8))
                    .frame(width: geo.size.width + 200, height: geo.size.height)
                    .blur(radius: 50)
                    .offset(y: geo.size.height / 3)
            }
            .background {
                // MARK: - BACKGROUND DISPLAY IMAGE
                AsyncImage(url: URL(string: product.displayImage.backgroundImage)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(geo.size.height / 220)
                            .blur(radius: 3)
                            .onAppear() {
                                self.productImage = image
                            }
                    default:
                        EmptyView()
                    }
                }
                .ignoresSafeArea()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: isAnimating)
            }
            .background(.bgGreen) // MARK: - BACKGROUND COLOR
        }
        .foregroundStyle(.white)
        .toolbar(.hidden)
        .task {
            withAnimation(.snappy(duration: 0.7)) {
                isAnimating = true
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ProductDetailsView(product: SR1(), isCartViewPresented: .constant(false))
        .environmentObject(MocProductsService())
        .environmentObject(CheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1))
}
