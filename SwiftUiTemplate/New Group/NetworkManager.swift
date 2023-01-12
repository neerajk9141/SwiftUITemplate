//
//  NetworkManager.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import Foundation
import Combine

final class NetworkManager{
    
    static let shared = NetworkManager(session: URLSession(configuration: .default))
    
    let urlSession: URLSession
    
    var cancellables = Set<AnyCancellable>()
    
    init(session:URLSession){
        urlSession = session
    }
    
    func startRequest(queryItem:String,endpoint:EndPoints, completion: @escaping (Data?,URLResponse?,Error?)->(Void)){
        
        guard let url = URL(string: endpoint.rawValue) else { return }
        
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "term", value: queryItem),URLQueryItem(name: "media", value: "music")])
        
        self.urlSession.dataTaskPublisher(for: request).sink { completion in
            switch completion{
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("Done")
            }
        } receiveValue: { result in
            completion(result.data,result.response,nil)
        }.store(in: &cancellables)
    }
}

enum EndPoints:String{
    case itunes = "https://itunes.apple.com/search?"
}
