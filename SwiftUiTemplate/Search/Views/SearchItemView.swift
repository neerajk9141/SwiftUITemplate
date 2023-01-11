//
//  SearchItemView.swift
//  SwiftUiTemplate
//
//  Created by Apple on 11/01/23.
//

import SwiftUI

struct SearchItemView: View {
    var image: String? = "person.fill"
    var title:String?
    var subtitle:String?
    
    var body: some View {
        
        HStack{
            
            Image(systemName: image ?? "")
            
            VStack(alignment:.leading){
                Text(title ?? "")
                Text(subtitle ?? "")
            }
            
        }
        
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
