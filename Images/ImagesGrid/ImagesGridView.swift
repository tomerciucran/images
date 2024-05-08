//
//  ImagesGridView.swift
//  Images
//
//  Created by Tomer Ciucran on 03.05.24.
//

import SwiftUI
import Kingfisher

struct ImagesGridView: View {
    @ObservedObject var viewModel: ImagesGridViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), 
                                GridItem(.flexible()),
                                GridItem(.flexible())]) {
                ForEach(viewModel.images) { image in
                    KFImage(URL(string: image.thumbnailUrl))
                        .cancelOnDisappear(true)
                        .placeholder {
                            Image(systemName: "arrow.2.circlepath.circle")
                                .font(.largeTitle)
                                .opacity(0.3)
                        }
                        .retry(maxCount: 3, interval: .seconds(2))
                        .frame(minWidth: 150, minHeight: 150)
                        .onTapGesture {
                            viewModel.handleImageTap(image: image)
                        }
                }
            }
        }
        .task {
            await viewModel.fetchImages()
        }
        .alert("Error", isPresented: $viewModel.showsErrorAlert) {
            Button("OK", role: .cancel) {
                viewModel.showsErrorAlert = false
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "Unknown error")
        }
    }
}
