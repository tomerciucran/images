//
//  PhotosServiceTests.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 07.05.24.
//

import XCTest
@testable import Images

final class PhotosServiceTests: XCTestCase {
    private var sut: PhotosService!
    private var urlSession: MockURLSession!

    override func setUpWithError() throws {
        urlSession = MockURLSession()
        sut = PhotosService(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        urlSession = nil
        sut = nil
    }
    
    func test_fetchPhotos_onSuccess() async throws {
        let jsonData = """
                [
                    {"id": 1, "title": "Test Photo", "url": "https://example.com/photo.jpg", "thumbnailUrl": "https://example.com/thumb.jpg"}
                ]
                """.data(using: .utf8)!
        urlSession.nextData = jsonData
        
        do {
            let photos = try await sut.fetchPhotos()
            XCTAssertEqual(photos.count, 1)
            XCTAssertEqual(photos.first?.id, 1)
        } catch {
            XCTFail()
        }
    }
    
    func test_fetchPhotos_onDecodingError() async throws {
        let jsonData = "{[".data(using: .utf8)!
        urlSession.nextData = jsonData
        
        do {
            _ = try await sut.fetchPhotos()
            XCTFail()
        } catch PhotosService.PhotosServiceError.decodingError(let error) {
            XCTAssertTrue(error is DecodingError)
        }
    }
}
