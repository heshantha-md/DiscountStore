//
//  FavouritesService.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import Foundation
import SwiftUI

final class FavouritesService: ObservableObject {
    // MARK: - PROPERTIES
    @Published var data: Products?
    
    // MARK: - FUNCTIONS
    @MainActor
    func add(product: ProductProtocol) {
        data?.append(product)
    }
    
    @MainActor
    func remove(product: ProductProtocol) {
        data?.removeAll(where: { $0.id == product.id })
    }
}
