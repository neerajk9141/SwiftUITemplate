//
//  SearchItemView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchItemView: View {
    var model: MusicResults?
    
    var body: some View {
        
        HStack{
            
            if let url = URL(string:model?.artworkUrl60 ?? ""){
                WebImage(url: url)
                    .resizable()

            }
            
            VStack(alignment:.leading){
                Text(model?.collectionName ?? "")
                Text(model?.shortDescription ?? "")
            }
            
        }
        .onAppear()
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
