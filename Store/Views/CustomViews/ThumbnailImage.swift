//
//  ThumbnailImage.swift
//  Store
//
//  Created by Heshantha Don on 19/03/2024.
//

import SwiftUI

struct ThumbnailImage: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .padding()
            default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ThumbnailImage(url: "https://static.vecteezy.com/system/resources/previews/022/430/955/original/strawberry-cut-out-red-strawberry-on-transparent-background-png.png")
}


