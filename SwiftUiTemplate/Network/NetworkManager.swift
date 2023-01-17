//
//  NetworkManager.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import Combine
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    private var cancellables = Set<AnyCancellable>()

    func startRequest<T: Codable>(queryItem: String, endpoint: EndPoints) -> Future<T, Error> {
        var request = URLRequest(url: URL(string: endpoint.rawValue)!)
        request.url?.append(queryItems: [URLQueryItem(name: "term", value: queryItem), URLQueryItem(name: "media", value: "music")])

        return Future<T, Error> { [weak self] req in

            guard let self = self else { return }
            
            URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200 ... 299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            req(.failure(decodingError))
                        case let apiError:
                            req(.failure(apiError))
                        default:
                            req(.failure(NetworkError.unknownError))
                        }
                    }
                }, receiveValue: {
                    req(.success($0))
                })
                .store(in: &self.cancellables)
        }
    }
}

enum EndPoints: String {
    case itunes = "https://itunes.apple.com/search?"
}

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
