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
    @Environment(\.dismiss) var dismiss
    let onDismiss: () -> Void
    
    var body: some View {
        NavigationStack {
            KFImage(viewModel.url)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(viewModel.isFavorite ? "Unfavorite" : "Favorite") {
                            viewModel.handleFavoriteButtonTap()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                }
                .onDisappear {
                    onDismiss()
                }
        }
    }
}
