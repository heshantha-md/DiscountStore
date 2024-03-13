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
    
    // MARK: - BODY
    var body: some View {
        BackgroundSymbol(image: image,
                         offset: CGSize(width: -(geometry.size.width / 3), height: -(geometry.size.height / 3)),
                         rotationDegree: .zero)
        
        BackgroundSymbol(image: image,
                         offset: CGSize(width: -(geometry.size.width / 3), height: -(geometry.size.height / 2.6)),
                         rotationDegree: .degrees(180))
    }
}
