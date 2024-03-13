//
//  BackgroundSymbol.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct BackgroundSymbol: View {
    // MARK: - PROPERTIES
    var image: Image
    var offset: CGSize
    var rotationDegree: Angle
    
    // MARK: - BODY
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .offset(offset)
            .rotationEffect(rotationDegree)
            .modifier(AppShadow())
    }
}

// MARK: - PREVIEW
#Preview {
    BackgroundSymbol(image: Image("bg1"),
                     offset: .zero,
                     rotationDegree: .zero)
}
