//
//  ImageDetailViewModel.swift
//  Images
//
//  Created by Tomer Ciucran on 05.05.24.
//

import Foundation

struct ImageDetailViewModel {
    let photo: Photo
    
    var url: URL? {
        return URL(string: photo.url)
    }
    
    var isFavorite: Bool {
        return photo.isFavorite
    }
    
    func handleFavoriteButtonTap() {
        print("Image Detail Favorite Button Tapped")
    }
}
