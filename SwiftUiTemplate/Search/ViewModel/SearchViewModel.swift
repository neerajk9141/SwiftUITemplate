//
//  SearchViewModel.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var model: SearchDataModel?

    private var cancellables = Set<AnyCancellable>()

    private func getSongs(for text: String) -> Future<SearchDataModel?, Error> {
        return NetworkManager.shared.startRequest(queryItem: text, endpoint: EndPoints.itunes)
    }

    func getItunesItems(text: String) {
        getSongs(for: text)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] data in
                self?.model = data
            }.store(in: &cancellables)
    }
}
