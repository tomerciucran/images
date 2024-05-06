//
//  MockPhotosService.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation
@testable import Images

final class MockPhotosService: PhotosServiceProtocol {
    var photos: [Photo] = []
    var error: Error?
    
    func fetchPhotos() async throws -> [Photo] {
        if let error = error {
            throw error
        }
        
        return photos
    }
}
