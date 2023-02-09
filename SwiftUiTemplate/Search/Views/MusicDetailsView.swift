//
//  MusicDetailsView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 17/01/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct MusicDetailsView: View {
    var model: MusicResults?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let url = URL(string: model?.artworkUrl60 ?? "") {
                    WebImage(url: url)
                        .resizable()
                        .scaledToFit()
                    Group {
                        Text("Name: \(model?.trackName ?? "")")
                        Text("Censored name: \(model?.collectionCensoredName ?? "")")
                        Text("Collection Price: \(model?.collectionPrice ?? 0.0)")
                        Text("Description: \(model?.longDescription ?? "")")
                        Text("Release Date: \(getDate(date:model?.releaseDate ?? ""))")
                        Text("Advisory Rating: \(model?.contentAdvisoryRating ?? "")")
                    }.padding()
                }
            }
        }
    }
    
    func getDate(date: String)->String{
        return date.toDate().toDateString(format: "dd-MM-yyyy HH:mm")
    }
}

struct MusicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicDetailsView()
    }
}
