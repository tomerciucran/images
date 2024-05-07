//
//  FavoritesStore.swift
//  Images
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation

protocol FavoritesStoreProtocol {
    func addFavorite(_ photo: Photo)
    func removeFavorite(with id: Int)
    var favorites: [Photo] { get }
}

final class FavoritesStore: FavoritesStoreProtocol {
    private let defaults: UserDefaults
    private let key = "Favorites"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        if defaults.data(forKey: key) == nil {
            let emptyData = try? JSONEncoder().encode([Photo]())
            defaults.set(emptyData, forKey: key)
        }
    }
    
    func addFavorite(_ photo: Photo) {
        var favorites = self.favorites
        if !favorites.contains(photo) {
            favorites.append(photo)
            saveFavorites(favorites)
        }
    }
    
    func removeFavorite(with id: Int) {
        var favorites = self.favorites
        if let index = favorites.firstIndex(where: { $0.id == id }) {
            favorites.remove(at: index)
            saveFavorites(favorites)
        }
    }
    
    var favorites: [Photo] {
        guard let data = defaults.data(forKey: key) else { return [] }
        return (try? JSONDecoder().decode([Photo].self, from: data)) ?? []
    }
    
    private func saveFavorites(_ photos: [Photo]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(photos) {
            defaults.set(encoded, forKey: key)
        }
    }
}
