//
//  FavoritesListView.swift
//  Images
//
//  Created by Tomer Ciucran on 06.05.24.
//

import SwiftUI

struct FavoritesListView: View {
    @ObservedObject var viewModel: FavoritesListViewModel
    
    var body: some View {
        List(viewModel.favorites) { favorite in
            Text(favorite.title)
                .onTapGesture {
                    viewModel.handleTap(on: favorite)
                }
        }
        .task {
            await viewModel.fetchImages()
        }
    }
}
