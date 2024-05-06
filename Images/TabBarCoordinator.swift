//
//  TabBarCoordinator.swift
//  Images
//
//  Created by Tomer Ciucran on 05.05.24.
//

import Foundation
import UIKit
import SwiftUI

final class TabBarCoordinator {
    let tabBarController: UITabBarController
    
    init() {
        let imageDetailCoordinator = ImageDetailCoordinator()
        let gridViewModel = ImagesGridViewModel(imageDetailCoordinator: imageDetailCoordinator)
        let gridView = ImagesGrid(viewModel: gridViewModel)
        
        let tabBarController = UITabBarController()
        let imagesGridViewController = UIHostingController(rootView: gridView)
        imagesGridViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let favoritesViewController = UIViewController()
        favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        imageDetailCoordinator.sourceController = {
            return imagesGridViewController
        }
        
        tabBarController.viewControllers = [imagesGridViewController, favoritesViewController]
        self.tabBarController = tabBarController
    }
}
