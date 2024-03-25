//
//  GlobleModifiers.swift
//  Store
//
//  Created by Heshantha Don on 13/03/2024.
//

import SwiftUI

struct AppShadow: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.4), radius: 5, x: 2, y: 2)
    }
}
