//
//  MainButton.swift
//  Store
//
//  Created by Heshantha Don on 13/03/2024.
//

import SwiftUI

struct MainButton: View {
    // MARK: - PROPERTIES
    var title: String
    var action: () -> Void
    
    // MARK: - BODY
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 10)
        
        Button {
            action()
        } label: {
            Text(title.uppercased())
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .font(.system(size: 30, weight: .heavy))
                .foregroundStyle(.white)
                .background {
                    if title == Constants.STRING.ADD_TO_CART {
                        Image("bg2")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .overlay {
                    rect
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                        .blendMode(.overlay)
                }
                .background(Colors.BG_GREEN_COLOR)
                .clipShape(rect)
        }
        .shadow(color: .black.opacity(0.3), radius: 10, x: 2, y: 2)
    }
}

// MARK: - PREVIEW
#Preview {
    MainButton(title: Constants.STRING.ADD_TO_CART, 
               action: {
        // Do something here
    })
    .padding()
}
