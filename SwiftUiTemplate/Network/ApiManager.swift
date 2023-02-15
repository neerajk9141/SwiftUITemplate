//
//  ApiManager.swift
//  SwiftUiTemplate
//
//  Created by Apple on 24/01/23.
//

import Foundation
import Combine

struct ApiManager: ApiServiceProtocol {
    func getSongs(for text: String) async -> Future<SearchDataModel?, Error> {
        let endpoint = ITunesEndpoint.getSong(searchText: text)
        return NetworkManager.shared.startRequest(endpoint: endpoint)
    }
}
