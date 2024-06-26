//
//  Photo.swift
//  Images
//
//  Created by Tomer Ciucran on 03.05.24.
//

import Foundation

struct Photo: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
