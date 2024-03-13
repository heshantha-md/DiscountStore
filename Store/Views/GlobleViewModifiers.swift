//
//  GlobleModifiers.swift
//  Store
//
//  Created by Heshantha Don on 13/03/2024.
//

import SwiftUI

struct AppShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.3), radius: 8, x: 2, y: 2)
    }
}
