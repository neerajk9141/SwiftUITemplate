//
//  EmptySearchView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 16/02/23.
//

import SwiftUI

struct EmptySearchView: View {
    var text: String
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .foregroundColor(.gray.opacity(0.8))
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct EmptySearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchView(text: "No Searches performed yet.")
    }
}
