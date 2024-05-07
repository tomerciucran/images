//
//  FavoritesListViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation

final class FavoritesListViewModel: ObservableObject {
    private let favoritesStore: FavoritesStoreProtocol
    private let service: PhotosServiceProtocol
    private let imageDetailCoordinator: ImageDetailCoordinating
    @Published private var images: [Photo] = []
    @Published private(set) var favorites: [Photo] = []
    
    init(favoritesStore: FavoritesStoreProtocol = FavoritesStore(),
         service: PhotosServiceProtocol = PhotosService(),
         imageDetailCoordinator: ImageDetailCoordinating) {
        self.favoritesStore = favoritesStore
        self.service = service
        self.imageDetailCoordinator = imageDetailCoordinator
    }
    
    func fetchImages() async {
        do {
            images = try await service.fetchPhotos()
            populateFavorites()
        } catch {
            //TODO: Handle the error on FavoritesListView by displaying an alert. Try using a published property.
            print(error)
        }
    }
    
    func handleTap(on image: Photo) {
        imageDetailCoordinator.openFullScreenImage(with: image)
    }
    
    private func populateFavorites() {
        favorites = favoritesStore.favorites.compactMap { id in
            images.first { photo in
                return photo.id == id
            }
        }
    }
}
