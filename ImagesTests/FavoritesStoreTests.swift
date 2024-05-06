//
//  FavoritesStoreTests.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import XCTest
@testable import Images

final class FavoritesStoreTests: XCTestCase {
    private var sut: FavoritesStore!
    private var defaults: UserDefaults!
    private let suiteName = "TestDefaults"

    override func setUpWithError() throws {
        defaults = UserDefaults(suiteName: suiteName)
        defaults.removePersistentDomain(forName: suiteName)
        sut = FavoritesStore(defaults: defaults)
    }

    override func tearDownWithError() throws {
        defaults.removePersistentDomain(forName: suiteName)
        defaults = nil
        sut = nil
    }

    func test_addFavorite() {
        sut.addFavorite(with: 123)
        
        XCTAssertEqual(sut.favorites, [123])
    }
    
    func test_removeFavorite() {
        sut.addFavorite(with: 123)
        sut.addFavorite(with: 456)
        sut.removeFavorite(with: 123)
        
        XCTAssertEqual(sut.favorites, [456])
    }
    
    func test_favorites() {
        sut.addFavorite(with: 12)
        sut.addFavorite(with: 34)
        
        XCTAssertEqual(sut.favorites, [12, 34])
    }
}
