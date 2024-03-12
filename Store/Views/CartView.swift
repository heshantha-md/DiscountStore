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
    @State private var totalCount: String = "0.00"
    @Binding var isPresented: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text(totalCount)
                .task {
                      await getTotal()
                }
            
            Button {
                isPresented = !isPresented
            } label: {
                Text("close")
            }
        }
    }
    
    // MARK: - FUNCTIONS
    @MainActor
    func getTotal() async {
        do {
//            self.totalCount = try await checkoutService.total().asPrice
        } catch {
            print(error.localizedDescription)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    CartView(isPresented: .constant(false))
}
