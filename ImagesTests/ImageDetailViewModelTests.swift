//
//  ImageDetailViewModelTests.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import XCTest
@testable import Images

final class ImageDetailViewModelTests: XCTestCase {
    private var sut: ImageDetailViewModel!
    private var favoritesStore: MockFavoritesStore!

    override func setUpWithError() throws {
        favoritesStore = MockFavoritesStore()
        let photo = Photo(id: 1,
                          title: "title",
                          url: "https://example.com/photo.jpg",
                          thumbnailUrl: "https://example.com/photo.jpg")
        sut = ImageDetailViewModel(photo: photo, favoritesStore: favoritesStore)
    }

    override func tearDownWithError() throws {
        favoritesStore = nil
        sut = nil
    }

    func test_init() {
        XCTAssertFalse(sut.isFavorite)
        
        let photo = Photo(id: 1,
                          title: "title",
                          url: "https://example.com/photo.jpg",
                          thumbnailUrl: "https://example.com/photo.jpg")
        favoritesStore.addFavorite(photo)
        sut = ImageDetailViewModel(photo: photo, favoritesStore: favoritesStore)
        
        XCTAssertTrue(sut.isFavorite)
    }
    
    func test_handleFavoriteButtonTap() {
        sut.handleFavoriteButtonTap()
        XCTAssertTrue(sut.isFavorite)
        
        sut.handleFavoriteButtonTap()
        XCTAssertFalse(sut.isFavorite)
    }
}
