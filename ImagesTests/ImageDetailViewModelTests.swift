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
    private let samplePhoto = Photo(id: 1,
                                    title: "title",
                                    url: "https://example.com/photo.jpg",
                                    thumbnailUrl: "https://example.com/photo.jpg")

    override func setUpWithError() throws {
        favoritesStore = MockFavoritesStore()
        sut = ImageDetailViewModel(photo: samplePhoto, favoritesStore: favoritesStore)
    }

    override func tearDownWithError() throws {
        favoritesStore = nil
        sut = nil
    }

    func test_init() {
        XCTAssertFalse(sut.isFavorite)
        
        favoritesStore.addFavorite(with: samplePhoto.id)
        sut = ImageDetailViewModel(photo: samplePhoto, favoritesStore: favoritesStore)
        
        XCTAssertTrue(sut.isFavorite)
    }
    
    func test_handleFavoriteButtonTap() {
        sut.handleFavoriteButtonTap()
        XCTAssertTrue(sut.isFavorite)
        
        sut.handleFavoriteButtonTap()
        XCTAssertFalse(sut.isFavorite)
    }
}
