//
//  MockURLSession.swift
//  ImagesTests
//
//  Created by Tomer Ciucran on 07.05.24.
//

import Foundation
@testable import Images

class MockURLSession: URLSessionProtocol {
    var nextData: Data?
    var nextError: Error?

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = nextError {
            throw error
        }
        guard let responseData = nextData else {
            fatalError("MockURLSession wasn't set up correctly")
        }
        return (responseData, URLResponse())
    }
}

