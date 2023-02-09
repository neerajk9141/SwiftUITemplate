//
//  SearchViewModel.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import Combine
import Foundation

protocol ApiServiceProtocol {
    func getSongs(for text: String) -> Future<SearchDataModel?, Error>
}

class SearchViewModel: ObservableObject {
    @Published var model: SearchDataModel?
    @Published var alertNotifier: String?
    private var cancellables = Set<AnyCancellable>()

    func getItunesItems(text: String) {
        ApiManager().getSongs(for: text)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    self.alertNotifier = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] data in
                self?.model = data
            }.store(in: &cancellables)
    }
}
