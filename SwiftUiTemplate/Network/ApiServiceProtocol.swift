//
//  ApiServiceProtocol.swift
//  SwiftUiTemplate
//
//  Created by Apple on 24/01/23.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func getSongs(for text: String) -> Future<SearchDataModel?, Error>
}
