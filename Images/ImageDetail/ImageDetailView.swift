//
//  ImageDetailView.swift
//  Images
//
//  Created by Tomer Ciucran on 05.05.24.
//

import SwiftUI
import Kingfisher

struct ImageDetailView: View {
    @ObservedObject var viewModel: ImageDetailViewModel
    
    var body: some View {
        NavigationStack {
            KFImage(viewModel.url)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    Button(viewModel.isFavorite ? "Unfavorite" : "Favorite") {
                        viewModel.handleFavoriteButtonTap()
                    }
                }
        }
    }
}
