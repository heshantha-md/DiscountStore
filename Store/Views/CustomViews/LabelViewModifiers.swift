//
//  LabelViewModifiers.swift
//  Store
//
//  Created by Heshantha Don on 12/03/2024.
//

import Foundation
import SwiftUI

struct TextBorder: ViewModifier {
    // MARK: - PROPERTIES
    var textColor: Color
    var borderColor: Color
    var lineWidth: CGFloat
    var paddingVertical: CGFloat
    var paddingHorizontal: CGFloat
    
    // MARK: - BODY
    func body(content: Content) -> some View {
        content
            .fontWeight(.heavy)
            .padding(.vertical, paddingVertical)
            .padding(.horizontal, paddingHorizontal)
            .foregroundStyle(textColor)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
            .shadow(color: borderColor, radius: lineWidth)
    }
}
