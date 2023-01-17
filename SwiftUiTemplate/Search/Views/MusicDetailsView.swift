//
//  MusicDetailsView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 17/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MusicDetailsView: View {
    var model: MusicResults?
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing: 10){
                if let url = URL(string:model?.artworkUrl60 ?? ""){
                    WebImage(url: url)
                        .resizable()
                        .frame(maxWidth:300,maxHeight: 250)
                    
                    Group{
                        Text(model?.artistName ?? "")
                        Text(model?.shortDescription ?? "")
                        Text("\(model?.collectionPrice ?? 0.0)")
                        Text(model?.longDescription ?? "")
                        Text(model?.releaseDate ?? "")
                        Text(model?.contentAdvisoryRating ?? "")

                    }

                }
            }
        }        
    }
}

struct MusicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicDetailsView()
    }
}
