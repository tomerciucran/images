//
//  PhotosService.swift
//  Images
//
//  Created by Tomer Ciucran on 03.05.24.
//

import Foundation

protocol PhotosServiceProtocol {
    func fetchPhotos() async throws -> [Photo]
}

final class PhotosService: PhotosServiceProtocol {
    enum PhotosServiceError: Error {
        case invalidUrl
        case decodingError(error: Error)
    }
    
    private let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchPhotos() async throws -> [Photo] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw PhotosServiceError.invalidUrl
        }
        
        let (data, _) = try await urlSession.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Photo].self, from: data)
        } catch {
            throw PhotosServiceError.decodingError(error: error)
        }
    }
}
