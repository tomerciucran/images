//
//  ImageDetailCoordinator.swift
//  Images
//
//  Created by Tomer Ciucran on 05.05.24.
//

import Foundation
import UIKit
import SwiftUI

protocol ImageDetailCoordinating {
    var sourceController: (() -> UIViewController)? { get set }
    func openFullScreenImage(with photo: Photo)
}

final class ImageDetailCoordinator: ImageDetailCoordinating {
    var sourceController: (() -> UIViewController)?
    
    func openFullScreenImage(with photo: Photo) {
        let viewModel = ImageDetailViewModel(photo: photo)
        let fullScreenImageView = ImageDetailView(viewModel: viewModel) {
            viewModel.handleFavoriteButtonTap()
        }
        
        let hostingViewController = UIHostingController(rootView: fullScreenImageView)
        
        sourceController?().show(hostingViewController, sender: nil)
    }
}
