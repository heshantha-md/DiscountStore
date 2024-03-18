//
//  HomeView.swift
//  Store
//
//  Created by Heshantha Don on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var productsService: MocProductsService
    @State private var gridLayout = Array(repeating: GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 0), count: 2)
    @State var isDataFetched: Bool = false
    @State var isCartViewPresented: Bool = false
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                // MARK: - LIST OF ITEMS
                ZStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, spacing: 0) {
                            ForEach(productsService.data.indices, id: \.self) { index in
                                NavigationLink(destination: ProductDetailsView(product: productsService.data[index], isCartViewPresented: $isCartViewPresented)) {
                                    // MARK: - PRODUCT CELL
                                    ProductGridItemView(product: productsService.data[index])
                                }
                            }
                        }
                        .padding(.top, 85)
                    }
                    .refreshable {
                        // MARK: - REFRESHING THE PRODUCTS LIST
                        Task {
                            await onAppearConfigurations()
                        }
                    }
                }
                .task {
                    // MARK: - FETCHING THE PRODUCTS LIST
                    if !isDataFetched {
                        await onAppearConfigurations()
                        isDataFetched = !isDataFetched
                    }
                }
                .sheet(isPresented: $isCartViewPresented) {
                    // MARK: - CART VIEW
                    CartView(isPresented: $isCartViewPresented)
                        .presentationBackground(.ultraThinMaterial)
                }
            }
            .background {
                // MARK: - BACKGROUND SYMBOLS
                BackgroundSymbolsView(image: Image("bg1"),
                                      geometry: geo)
                        .offset(y: -150)
            }
            .background(.ultraThinMaterial) // MARK: - BACKGROUND
            .background(Colors.BACKGROUND_COLOR
                .ignoresSafeArea())
            .overlay(alignment: .topLeading) {
                // MARK: - NAVIGATION BAR
                PrimaryNavigationBar(isCartViewPresented: $isCartViewPresented)
                    .padding(.horizontal, 15)
            }
        }
    }
    
    // MARK: - FUNCTIONS
    private func onAppearConfigurations() async {
        do {
            try await productsService.fetchData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(MocProductsService())
    .environmentObject(MocCheckoutService(rules: MOC.CHECKOUT_RULES_SAMPLE_1) as! CheckoutService)
    .toolbar(.hidden)
}
