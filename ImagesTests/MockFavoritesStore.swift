//
//  MockFavoritesStore.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation
@testable import Images

final class MockFavoritesStore: FavoritesStoreProtocol {
    var customFavorites: Set<Photo> = []
    
    func addFavorite(_ photo: Photo) {
        customFavorites.insert(photo)
    }
    
    func removeFavorite(with id: Int) {
        if let item = favorites.first(where: { id == $0.id }) {
            customFavorites.remove(item)
        }
    }
    
    var favorites: [Images.Photo] {
        return Array(customFavorites)
    }
    
    
}
