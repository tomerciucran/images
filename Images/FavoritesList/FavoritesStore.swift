//
//  FavoritesStore.swift
//  Images
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation

protocol FavoritesStoreProtocol {
    func addFavorite(with id: Int)
    func removeFavorite(with id: Int)
    var favorites: [Int] { get }
}

final class FavoritesStore: FavoritesStoreProtocol {
    private let defaults: UserDefaults
    private let key = "Favorites"
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        if defaults.array(forKey: key) == nil {
            defaults.set([Int](), forKey: key)
        }
    }
    
    func addFavorite(with id: Int) {
        var favorites = favorites
        if !favorites.contains(id) {
            favorites.append(id)
            defaults.set(favorites, forKey: key)
        }
    }
    
    func removeFavorite(with id: Int) {
        var favorites = favorites
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
            defaults.set(favorites, forKey: key)
        }
    }
    
    var favorites: [Int] {
        return defaults.array(forKey: key) as? [Int] ?? []
    }
}
