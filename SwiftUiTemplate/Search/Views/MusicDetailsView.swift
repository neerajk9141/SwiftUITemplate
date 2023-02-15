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
                        .placeholder(Image(systemName: "camera.fill"))
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(50)
                        .padding()
                    Group {
                        HStack {
                            Text("Name: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(model?.trackName ?? "")
                        }
                        HStack {
                            Text("Artist Name: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(model?.artistName ?? "")
                        }
                        HStack {
                            Text("Censored name: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(model?.collectionCensoredName ?? "")
                        }
                    }.padding()
                    Group {
                        HStack {
                            Text("Collection Price: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text("\(model?.collectionPrice ?? 0.0)")
                        }
                        HStack {
                            Text("Description: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(model?.longDescription ?? "")
                        }
                        HStack {
                            Text("Release Date: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(getDate(date: model?.releaseDate ?? ""))
                        }
                        HStack {
                            Text("Advisory Rating: ")
                                .bold()
                                .font(Font.system(size: 16))
                            Text(model?.contentAdvisoryRating ?? "")
                        }
                    }.padding()
                }
            }
        }
    }

    func getDate(date: String) -> String {
        return date.toDate().toDateString(format: "dd-MM-yyyy HH:mm")
    }
}

struct MusicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MusicDetailsView()
    }
}
