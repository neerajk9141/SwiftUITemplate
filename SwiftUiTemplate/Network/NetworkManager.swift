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

struct ApiManager: ApiServiceProtocol{
    func getSongs(for text: String) -> Future<SearchDataModel?, Error> {
        let endpoint = ITunesEndpoint.getSong(searchText: text)
        return NetworkManager.shared.startRequest(endpoint: endpoint)
    }
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

protocol Endpoint {
    // HTTP or HTTPS
    var scheme: String { get }

    // Example itunes.apple.com
    var baseURL: String { get }

    // /search/
    var path: String { get }

    // search?term=taylor+swift
    var params: [URLQueryItem] { get }

    var method: String { get }

    var port: Int? { get }
}

enum ITunesEndpoint: Endpoint {
    case getSong(searchText: String)
    case failure
    var scheme: String {
        switch self {
        default:
            return CommandLine.arguments.contains("-debugServer") ? "http" : "https"
        }
    }

    var baseURL: String {
        switch self {
        default:
            return CommandLine.arguments.contains("-debugServer") ? "localhost" : "itunes.apple.com"
        }
    }

    var path: String {
        switch self {
        case .failure: return "/fail"
        case .getSong:
            return "/search"
        }
    }

    var port: Int? {
        switch self {
        default:
            return CommandLine.arguments.contains("-debugServer") ? 9999 : nil
        }
    }

    var params: [URLQueryItem] {
        switch self {
        case .failure:
            return []
        case let .getSong(searchTerm):
            return [URLQueryItem(name: "term", value: searchTerm), URLQueryItem(name: "media", value: "music")]
        }
    }

    var method: String {
        switch self {
        case .failure: return "get"
        case .getSong:
            return "get"
        }
    }
}
