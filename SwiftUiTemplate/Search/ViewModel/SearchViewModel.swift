//
//  SearchViewModel.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import Foundation
import Combine

class SearchViewModel:ObservableObject{
    
    @Published var model: SearchDataModel?
    
    private var cancellables = Set<AnyCancellable>()
    
    private func getSongs(for text: String) -> Future<SearchDataModel?, Error> {
        return NetworkManager.shared.startRequest(queryItem: text, endpoint: EndPoints.itunes)
    }
    
    func getItunesItems(text:String){
        
        self.getSongs(for: text)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    print("Finished")
                }
            } receiveValue: { data in
                self.model = data
            }.store(in: &cancellables)

    }
    
}
