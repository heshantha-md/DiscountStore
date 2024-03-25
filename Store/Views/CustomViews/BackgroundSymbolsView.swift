//
//  BackgroundSymbolsView.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct BackgroundSymbolsView: View {
    // MARK: - PROPERTIES
    var image: Image
    @State var geometry: GeometryProxy
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            BackgroundSymbol(image: image,
                             offset: CGSize(width: -(geometry.size.width / 3), height: -(geometry.size.height / 3)),
                             rotationDegree: isAnimating ? .zero : .degrees(30))
            
            BackgroundSymbol(image: image,
                             offset: CGSize(width: -(geometry.size.width / 3), height: -(geometry.size.height / 2.6)),
                             rotationDegree: isAnimating ? .degrees(180) : .degrees(240))
        }
        .task {
            await MainActor.run {
                withAnimation(.bouncy(duration: 1.3)) {
                    isAnimating.toggle()
                }
            }
        }
    }
}
