//
//  ViewError.swift
//  Store
//
//  Created by Heshantha Don on 08/03/2024.
//

import Foundation

enum ViewError: Error, LocalizedError {
    case emptyBucket
    case errorFetchingData
    
    var errorDescription: String? {
        switch self {
        case .emptyBucket:
            "Your bucket is empty."
        case .errorFetchingData:
            "Sorry! There was an error when retrieving data."
        }
    }
}
