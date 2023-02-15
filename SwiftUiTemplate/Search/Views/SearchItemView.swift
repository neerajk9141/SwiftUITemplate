//
//  SearchItemView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchItemView: View {
    var model: MusicResults?

    var body: some View {
        HStack {
            if let url = URL(string: model?.artworkUrl60 ?? "") {
                WebImage(url: url)
                    .placeholder(Image(systemName: "camera.fill"))
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
            }

            VStack(alignment: .leading) {
                Text(model?.trackName ?? "")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(Color.black)
                Text(model?.artistName ?? "")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
        }
        .padding(5)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
