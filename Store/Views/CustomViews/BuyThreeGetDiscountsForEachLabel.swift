//
//  BuyThreeGetDiscountsForEachLabel.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import SwiftUI

struct BuyThreeGetDiscountsForEachLabel: View {
    // MARK: - PROPERTIES
    @State var discount: String
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: -8) {
            HStack(spacing: 5) {
                Text("Buy")
                    .font(.title3)
                Text("3")
                    .font(.largeTitle)
            }
            .fontDesign(.serif)
            VStack(alignment: .trailing, spacing: -5) {
                Text(discount)
                    .font(.title3)
                Text("each")
                    .fontWeight(.semibold)
                    .font(.system(size: 10))
            }
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
    BuyThreeGetDiscountsForEachLabel(discount: "£1000.50")
}
