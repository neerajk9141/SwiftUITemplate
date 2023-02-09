//
//  NetworkError.swift
//  SwiftUiTemplate
//
//  Created by Apple on 24/01/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURLError
    case responseError
    case unknownError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURLError:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unknown status code", comment: "Invalid response")
        case .unknownError:
            return NSLocalizedString("Something went wrong", comment: "Unknown error")
        }
    }
}
