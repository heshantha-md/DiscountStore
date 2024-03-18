//
//  CartView.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import SwiftUI

struct CartView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var checkoutService: CheckoutService
    @State private var totalGrossPrice: Float = 0.00
    @State private var totalNetPrice: Float = 0.00
    @State private var totalDiscountsPrice: Float = 0.00
    @Binding var isPresented: Bool
    @State var arr = ["bal","bal","bal","bal","bal"]
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: - BACKGROUND SYMBOLS
                BackgroundSymbolsView(image: Image("bg3"),
                                      geometry: geo)
                
                VStack(spacing: -5) {
                    // MARK: - NAVIGATION BAR
                    HStack {
                        HStack {
                            Image(systemName: "cart")
                            if checkoutService.cart.count > 0 {
                                Text("\(checkoutService.cart.count) \(checkoutService.cart.count > 1 ? Constants.STRING.ITEMS : Constants.STRING.ITEM)")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Colors.FONT_COLOR_3)
                                    .foregroundStyle(Colors.FONT_COLOR_4)
                                    .clipShape(Capsule())
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: { isPresented.toggle() }, label: {
                            Image(systemName: "arrow.down")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Colors.FONT_COLOR_3)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        })
                    }
                    .frame(height: 50)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 15)
                    .padding(.top, 30)
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text(Constants.STRING.ITEMS_IN_YOUR_CART)
                                .padding(.horizontal, 12)
                            
                            // MARK: - LIST OF ITEMS
                            List {
                                ForEach(checkoutService.cart.indices, id: \.self) { index in
                                    CartItemCell(index: index + 1, product: $checkoutService.cart[index])
                                }
                                .listRowBackground(Color.clear)
                            }
                            .listStyle(.plain)
                        }
                        .padding(.vertical, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.headline)
                    .background(.ultraThinMaterial)
                    .padding(.vertical)
                    
                    Group {
                        VStack(spacing: 7) {
                            // MARK: - GROSS AND DISCOUNTS
                            if totalDiscountsPrice > 0 {
                                VStack {
                                    HStack {
                                        Text(Constants.STRING.GROSS)
                                        Spacer()
                                        Text(totalGrossPrice.asPrice)
                                            .fontWeight(.heavy)
                                    }
                                    
                                    HStack {
                                        Text(Constants.STRING.DISCOUNT)
                                        Spacer()
                                        Text(totalDiscountsPrice.asPrice)
                                            .fontWeight(.heavy)
                                            .foregroundStyle(Colors.BG_GREEN_COLOR)
                                    }
                                }
                                .font(.callout)
                            }
                            
                            // MARK: - TOTAL
                            HStack {
                                Text(Constants.STRING.TOTAL)
                                    .fontWeight(.bold)
                                Spacer()
                                Text(totalNetPrice.asPrice)
                                    .font(.system(.title2, design: .rounded, weight: .heavy))
                            }
                        }
                        
                        // MARK: - BUY BUTTON
                        MainButton(title: Constants.STRING.BUY, icon: Image(systemName: "bag.circle.fill")) {
                            // TODO: - Need to implement the pay feature here
                        }
                    }
                    .padding(15)
                }
            }
        }
        .task {
            await refreshData()
        }
    }
    
    // MARK: - FUNCTIONS
    @MainActor
    private func getTotalNetPrice() async {
        do {
            self.totalNetPrice = try await checkoutService.totalNetPrice()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func getTotalGrossPrice() async {
        do {
            self.totalGrossPrice = try await checkoutService.totalGrossPrice()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func getTotalDiscountsPrice() async {
        do {
            self.totalDiscountsPrice = try await checkoutService.totalDiscountsPrice()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func refreshData() async {
        await checkoutService.calculateDiscounts()
        await getTotalNetPrice()
        await getTotalGrossPrice()
        await getTotalDiscountsPrice()
    }
}

// MARK: - PREVIEW
#Preview {
    CartView(isPresented: .constant(false))
        .environmentObject(MocCheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1) as! CheckoutService)
}
