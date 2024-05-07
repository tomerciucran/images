//
//  MockImageDetailCoordinator.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 06.05.24.
//

import Foundation
import UIKit
@testable import Images

final class MockImageDetailCoordinator: ImageDetailCoordinating {
    var sourceController: (() -> UIViewController)?
    var lastOpenedPhoto: Photo?
    
    func openFullScreenImage(with photo: Photo, dismissalHandler: @escaping () -> Void) {
        lastOpenedPhoto = photo
    }
}
