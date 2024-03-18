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
    var icon: Image?
    var action: () -> Void
    
    // MARK: - BODY
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 10)
        
        Button {
            action()
        } label: {
            HStack(spacing: 15) {
                if let icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                
                Text(title.uppercased())
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .font(.system(size: 25, weight: .semibold, design: .rounded))
            .foregroundStyle(.white)
            .background {
                if title == Constants.STRING.ADD_TO_CART {
                    Image("bg2")
                        .resizable()
                        .scaledToFit()
                }
            }
            .background(Colors.BG_GREEN_COLOR)
            .clipShape(rect)
        }
        .modifier(AppShadow(color: .black))
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
