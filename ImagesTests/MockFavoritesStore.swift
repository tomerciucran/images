//
//  MockFavoritesStore.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation
@testable import Images

final class MockFavoritesStore: FavoritesStoreProtocol {
    private var favoritesSet: Set<Int> = []
    
    func addFavorite(with id: Int) {
        favoritesSet.insert(id)
    }
    
    func removeFavorite(with id: Int) {
        favoritesSet.remove(id)
    }
    
    var favorites: [Int] {
        return Array(favoritesSet)
    }
}
