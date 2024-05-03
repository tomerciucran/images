//
//  ImagesGridViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 03.05.24.
//

import Foundation

final class ImagesGridViewModel: ObservableObject {
    private let service: PhotosServiceProtocol
    @Published private(set) var images: [Photo] = []
    
    init(service: PhotosServiceProtocol = PhotosService()) {
        self.service = service
    }
    
    func fetchImages() async {
        do {
            images = try await service.fetchPhotos()
        } catch {
            print(error)
        }
    }
}
