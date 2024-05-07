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
    
    init(service: PhotosServiceProtocol = PhotosService(),
         imageDetailCoordinator: ImageDetailCoordinating) {
        self.service = service
        self.imageDetailCoordinator = imageDetailCoordinator
    }
    
    func fetchImages() async {
        do {
            images = try await service.fetchPhotos()
        } catch {
            //TODO: Handle the error on ImageDetailView by displaying an alert. Try using a published property.
            print(error)
        }
    }
    
    func handleImageTap(image: Photo) {
        imageDetailCoordinator.openFullScreenImage(with: image) {}
    }
}
