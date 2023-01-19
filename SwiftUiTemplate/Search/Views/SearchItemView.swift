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
                    .resizable()
                    .frame(maxWidth: 50, maxHeight: 60)
            }

            VStack(alignment: .leading) {
                Text(model?.trackName ?? "")
                Text(model?.shortDescription ?? "")
            }
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
