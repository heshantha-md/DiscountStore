//
//  Extensions.swift
//  Store
//
//  Created by Heshantha Don on 11/03/2024.
//

import Foundation

extension Float {
    var asPrice: String {
        return String(format: "\(Constants.Currency.GBP)%.2f", self)
    }
}
