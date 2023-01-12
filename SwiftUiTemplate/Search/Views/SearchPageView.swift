//
//  SearchPageView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchPageView: View {
    
    @State private var searchText = ""
    
    var viewModel = SearchViewModel()
       
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(alignment:.leading,spacing: 20) {
                    ForEach(searchResults, id: \.self) { model in
                        NavigationLink {
                            VStack{
                                if let url = URL(string:model.artworkUrl60 ?? ""){
                                    WebImage(url: url)
                                        .resizable()

                                }
                                    
                            }
                            
                        } label: {
                            
                            if !searchText.isEmpty{
                                SearchItemView(model: model)
                            }
                           
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding( )
            }
            .navigationTitle("iTunes Search")
        }
        
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                SearchItemView(model: result).searchCompletion(result)
            }
        }
    }
        
        var searchResults: [MusicResults] {
            if searchText.isEmpty {
                return []
            } else {
                self.viewModel.getItunesItems(text: searchText)
                return self.viewModel.model?.results ?? []
            }
        }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
