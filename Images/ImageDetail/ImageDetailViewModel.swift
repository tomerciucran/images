//
//  ImageDetailViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 05.05.24.
//

import Foundation

final class ImageDetailViewModel: ObservableObject {
    private let photo: Photo
    private let favoritesStore: FavoritesStoreProtocol
    @Published var isFavorite: Bool
    
    init(photo: Photo,
         favoritesStore: FavoritesStoreProtocol = FavoritesStore()) {
        self.photo = photo
        self.favoritesStore = favoritesStore
        isFavorite = favoritesStore.favorites.contains(photo)
    }
    
    var url: URL? {
        return URL(string: photo.url)
    }
    
    func handleFavoriteButtonTap() {
        if isFavorite {
            favoritesStore.removeFavorite(with: photo.id)
        } else {
            favoritesStore.addFavorite(photo)
        }
        updateIsFavorite()
    }
    
    private func updateIsFavorite() {
        isFavorite = favoritesStore.favorites.contains(photo)
    }
}
