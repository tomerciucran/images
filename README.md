## Overview
Images is an iOS application built using Swift, designed to showcase an effective implementation of the MVVM-C (Model-View-ViewModel-Coordinator) architecture. The app features a tab bar interface with two main sections: a grid of images and a list of favorites. It utilizes the Kingfisher library for downloading and caching images efficiently, making use of modern SwiftUI views like `LazyVGrid` for performance optimization.

## Features

### Image Grid
- **Dynamic Image Loading**: Utilizes `LazyVGrid` to ensure that images are loaded dynamically and efficiently as the user scrolls, enhancing the performance and user experience.

### Favorites Management
- **Interactive Favorites**: Users can add or remove images from their favorites, which are persisted locally using `UserDefaults`.
- **Favorites List**: Displays a list of all favorite images with simple tap gestures to remove favorites or view in full-screen.

### Full-Screen Image Detail
- **Detail View**: Offers a detailed view of images with options to favorite/unfavorite and close the view.

### Kingfisher Integration
- **Robust and Reliable**: Implements the Kingfisher framework, which is widely used and well-tested, ensuring robustness in handling image downloads and caching. This choice provides reliability out of the box with extensive community support and ongoing maintenance.
- **Features**:
  - `cancelOnDisappear`: Automatically cancels image download tasks when the view disappears, helping to conserve device resources and network usage.
  - `retry`: Provides resilience by retrying the download of images if the initial attempt fails, ensuring that images are loaded even in cases of intermittent network issues.
  - **Caching**: Images are cached once downloaded, which reduces network requests, speeds up image loading on subsequent views, and enhances the overall user experience.

## Architecture

### MVVM-C
- **Model**: Defines the essential data structures and data management (e.g., `FavoritesStore`).
- **View**: SwiftUI views (`ImagesGridView`, `FavoritesListView`, `ImageDetailView`) which present the data and handle user interactions.
- **ViewModel**: Manages the presentation logic and state of the views (`ImagesGridViewModel`, `FavoritesListViewModel`, `ImageDetailViewModel`).
- **Coordinator**: Handles navigation and the flow of the application (`TabBarCoordinator`, `ImageDetailCoordinator`), decoupling navigation from view models and views.

### Testing
- Unit tests are included to verify the functionality of models, view models, and utility components, ensuring reliability and robustness.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
