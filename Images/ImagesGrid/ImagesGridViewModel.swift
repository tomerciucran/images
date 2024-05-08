//
//  ImagesGridViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 03.05.24.
//

import Foundation

final class ImagesGridViewModel: ObservableObject {
    private let service: PhotosServiceProtocol
    private let imageDetailCoordinator: ImageDetailCoordinating
    
    @Published private(set) var images: [Photo] = []
    @Published private(set) var error: Error?
    @Published var showsErrorAlert = false
    
    init(service: PhotosServiceProtocol = PhotosService(),
         imageDetailCoordinator: ImageDetailCoordinating) {
        self.service = service
        self.imageDetailCoordinator = imageDetailCoordinator
    }
    
    func fetchImages() async {
        do {
            let images = try await service.fetchPhotos()
            await MainActor.run {
                self.images = images
            }
        } catch {
            await MainActor.run {
                self.error = error
                showsErrorAlert = true
            }
        }
    }
    
    func handleImageTap(image: Photo) {
        imageDetailCoordinator.openFullScreenImage(with: image) {}
    }
}
