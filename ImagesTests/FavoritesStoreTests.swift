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
        let photo = Photo(id: 123, title: "Test Photo", url: "http://example.com/photo.jpg", thumbnailUrl: "http://example.com/thumb.jpg")
        sut.addFavorite(photo)
        
        XCTAssertEqual(sut.favorites, [photo])
    }
    
    func test_removeFavorite() {
        let photo1 = Photo(id: 123, title: "Test Photo 1", url: "http://example.com/photo1.jpg", thumbnailUrl: "http://example.com/thumb1.jpg")
        let photo2 = Photo(id: 456, title: "Test Photo 2", url: "http://example.com/photo2.jpg", thumbnailUrl: "http://example.com/thumb2.jpg")
        
        sut.addFavorite(photo1)
        sut.addFavorite(photo2)
        sut.removeFavorite(with: 123)
        
        XCTAssertEqual(sut.favorites, [photo2])
    }
    
    func test_favorites() {
        let photo1 = Photo(id: 12, title: "Test Photo 1", url: "http://example.com/photo1.jpg", thumbnailUrl: "http://example.com/thumb1.jpg")
        let photo2 = Photo(id: 34, title: "Test Photo 2", url: "http://example.com/photo2.jpg", thumbnailUrl: "http://example.com/thumb2.jpg")
        
        sut.addFavorite(photo1)
        sut.addFavorite(photo2)
        
        XCTAssertEqual(sut.favorites, [photo1, photo2])
    }
}
