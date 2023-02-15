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

    func startRequest<T: Codable>(endpoint: Endpoint) -> Future<T, Error> {
        var urlComponents = URLComponents()
        urlComponents.host = endpoint.baseURL
        urlComponents.path = endpoint.path
        urlComponents.scheme = endpoint.scheme
        urlComponents.queryItems = endpoint.params
        urlComponents.port = endpoint.port

        return Future<T, Error> { [weak self] req in

            guard let self = self, let url = urlComponents.url else {
                return req(.failure(NetworkError.invalidURLError))
            }

            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method

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
