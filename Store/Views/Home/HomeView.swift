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
    @State var isCartPresented: Bool = true
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                // MARK: - BACKGROUND SYMBOLS
                BackgroundSymbolsView(image: Image("bg1"),
                                      geometry: geo)
                
                // MARK: - LIST OF ITEMS
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, spacing: 0) {
                            ForEach(productsService.data.indices, id: \.self) { index in
                                NavigationLink(destination: ProductDetailsView(product: productsService.data[index])) {
                                    // MARK: - PRODUCT CELL
                                    ProductGridItemView(product: productsService.data[index])
                                }
                            }
                        }
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
                .sheet(isPresented: $isCartPresented) {
                    // MARK: - CART VIEW
                    CartView(isPresented: $isCartPresented)
                        .presentationBackground(.ultraThinMaterial)
                }
//                .toolbar {
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Button {
//                            isCartPresented = !isCartPresented
//                        } label: {
//                            Image(systemName: "cart.fill")
//                        }
//                    }
//                }
            }
            .background(.ultraThinMaterial) // MARK: - BACKGROUND
            .background(Colors.BACKGROUND_COLOR
                .ignoresSafeArea())
            .toolbar(.hidden)
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
}
