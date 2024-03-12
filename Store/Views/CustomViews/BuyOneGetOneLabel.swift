//
//  BuyOneGetOneLabel.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct BuyOneGetOneLabel: View {
    // MARK: - PROPERTIES
    var body: some View {
        VStack(spacing: -5) {
            HStack(spacing: 5) {
                VStack(spacing: -5) {
                    Text("Buy")
                    Text("Get")
                }
                .font(.callout)
                Text("1")
                    .font(.largeTitle)
            }
            .fontDesign(.serif)
            Text("FREE")
                .font(.title3)
        }
        .modifier(TextBorder(textColor: .black,
                             borderColor: .yellow,
                             lineWidth: 1,
                             paddingVertical: 6,
                             paddingHorizontal: 13))
    }
}

// MARK: - PREVIEW
#Preview {
    BuyOneGetOneLabel()
}
