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
    
    var cancellables = Set<AnyCancellable>()
    
    func getItunesItems(text:String){
        
        NetworkManager.shared.startRequest(queryItem: text, endpoint: EndPoints.itunes) { data, response, error in
            
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            
            if let data = data{
                let model = try? JSONDecoder().decode(SearchDataModel.self, from: data)
                self.model = model
                self.objectWillChange.send()
            }
        }
        
    }
    
}
