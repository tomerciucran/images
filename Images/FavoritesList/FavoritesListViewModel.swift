//
//  FavoritesListViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation

final class FavoritesListViewModel: ObservableObject {
    private let favoritesStore: FavoritesStoreProtocol
    private let imageDetailCoordinator: ImageDetailCoordinating
    @Published private(set) var favorites: [Photo] = []
    
    init(favoritesStore: FavoritesStoreProtocol = FavoritesStore(),
         imageDetailCoordinator: ImageDetailCoordinating) {
        self.favoritesStore = favoritesStore
        self.imageDetailCoordinator = imageDetailCoordinator
    }
    
    func handleTap(on image: Photo) {
        imageDetailCoordinator.openFullScreenImage(with: image) { [weak self] in
            self?.updateFavorites()
        }
    }
    
    func updateFavorites() {
        favorites = favoritesStore.favorites
    }
}
