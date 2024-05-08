//
//  ImagesGridViewModelTests.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import XCTest
@testable import Images

final class ImagesGridViewModelTests: XCTestCase {
    private var sut: ImagesGridViewModel!
    private var service: MockPhotosService!
    private var coordinator: MockImageDetailCoordinator!
    private let samplePhotos: [Photo] = [
        Photo(id: 1,
              title: "",
              url: "https://example.com/photo1.jpg",
              thumbnailUrl: "https://example.com/photo1.jpg"),
        Photo(id: 2,
              title: "",
              url: "https://example.com/photo2.jpg",
              thumbnailUrl: "https://example.com/photo2.jpg")
    ]

    override func setUpWithError() throws {
        service = MockPhotosService()
        coordinator = MockImageDetailCoordinator()
        sut = ImagesGridViewModel(service: service, imageDetailCoordinator: coordinator)
    }

    override func tearDownWithError() throws {
        service = nil
        coordinator = nil
        sut = nil
    }

    func test_fetchImages_onSuccess() async {
        service.photos = samplePhotos
        
        await sut.fetchImages()
        
        XCTAssertEqual(sut.images, samplePhotos)
    }
    
    func test_fetchImages_onFailure() async {
        service.error = NSError(domain: "TestError", code: 1, userInfo: nil)
        
        await sut.fetchImages()
        
        XCTAssertTrue(sut.images.isEmpty)
        XCTAssertNotNil(sut.error)
        XCTAssertTrue(sut.showsErrorAlert)
    }
    
    func test_handleImageTap() {
        let photo = Photo(id: 3,
                          title: "",
                          url: "https://example.com/photo3.jpg",
                          thumbnailUrl: "https://example.com/photo3.jpg")
        sut.handleImageTap(image: photo)
        
        XCTAssertEqual(coordinator.lastOpenedPhoto, photo)
    }
}
