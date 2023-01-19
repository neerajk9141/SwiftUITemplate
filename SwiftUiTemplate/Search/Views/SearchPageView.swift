//
//  SearchPageView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchPageView: View {
    @State private var searchText = ""
    @State private var showAlert = false
    var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView{
                if !searchResults.isEmpty{
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(searchResults, id: \.self) { model in
                            NavigationLink {
                                MusicDetailsView(model: model)
                            } label: {
                                SearchItemView(model: model)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding()

                }else{
                    searchText.isEmpty ? Text("No searches performed") : Text("No result found")
                }
            }
            .navigationTitle("iTunes song Search")
        }
        .searchable(text: $searchText, prompt: "Search songs on iTunes.")
        .autocorrectionDisabled(true)
        .onChange(of: searchText) { _ in
            viewModel.getItunesItems(text: searchText)
        }
        .onChange(of: viewModel.alertNotifier, perform: { newValue in
            showAlert.toggle()
        })
        .onSubmit(of: .search) {
            viewModel.getItunesItems(text: searchText)
        }
        .alert(viewModel.alertNotifier ?? "", isPresented: $showAlert) {
            
        }
    }

    var searchResults: [MusicResults] {
        if searchText.isEmpty {
            return []
        } else {
            return viewModel.model?.results ?? []
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
