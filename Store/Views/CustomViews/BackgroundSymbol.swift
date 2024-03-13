//
//  BackgroundSymbol.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct BackgroundSymbol: View {
    // MARK: - PROPERTIES
    var offset: CGSize
    var rotationDegree: Angle
    
    // MARK: - BODY
    var body: some View {
        Image("bg1")
            .resizable()
            .scaledToFit()
            .offset(offset)
            .rotationEffect(rotationDegree)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
    }
}

// MARK: - PREVIEW
#Preview {
    BackgroundSymbol(offset: .zero, 
                     rotationDegree: .zero)
}
