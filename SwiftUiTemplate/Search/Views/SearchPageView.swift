//
//  SearchPageView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SwiftUI

struct SearchPageView: View {
    
    let names = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8"]
    @State private var searchText = ""
       
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(alignment:.leading,spacing: 20) {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            VStack{
                                Image(systemName: "person.fill")
                                    .resizable()
                                Text(name)
                            }
                            
                        } label: {
                            
                            if !searchText.isEmpty{
                                SearchItemView(image: "person.fill",title: name,subtitle: "description to test")
                            }
                           
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding( )
            }
            .navigationTitle("iTunes Search")
        }
        
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                Text("\(result)").searchCompletion(result)
            }
        }
    }
        
        var searchResults: [String] {
            if searchText.isEmpty {
                return [""]
            } else {
                return names.filter { $0.contains(searchText) }
            }
        }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
