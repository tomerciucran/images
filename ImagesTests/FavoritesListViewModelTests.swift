//
//  FavoritesListViewModelTests.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 07.05.24.
//

import XCTest
@testable import Images

final class FavoritesListViewModelTests: XCTestCase {
    private var sut: FavoritesListViewModel!
    private var favoritesStore: MockFavoritesStore!
    private var imageDetailCoordinator: MockImageDetailCoordinator!

    override func setUpWithError() throws {
        favoritesStore = MockFavoritesStore()
        imageDetailCoordinator = MockImageDetailCoordinator()
        sut = FavoritesListViewModel(favoritesStore: favoritesStore,
                                     imageDetailCoordinator: imageDetailCoordinator)
    }

    override func tearDownWithError() throws {
        favoritesStore = nil
        imageDetailCoordinator = nil
        sut = nil
    }
    
    func test_handleTap() {
        let photo = Photo(id: 3,
                          title: "",
                          url: "https://example.com/photo3.jpg",
                          thumbnailUrl: "https://example.com/photo3.jpg")
        sut.handleTap(on: photo)
        
        XCTAssertEqual(imageDetailCoordinator.lastOpenedPhoto, photo)
    }
    
    func test_updateFavorites() {
        XCTAssertEqual(sut.favorites, [])
        
        let photo = Photo(id: 1,
                          title: "",
                          url: "https://example.com/photo1.jpg",
                          thumbnailUrl: "https://example.com/photo1.jpg")
        favoritesStore.addFavorite(photo)
        sut.updateFavorites()
        
        XCTAssertEqual(sut.favorites, [photo])
    }
}
