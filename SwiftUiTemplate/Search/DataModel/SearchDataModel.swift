//
//  SearchDataModel.swift
//  SwiftUiTemplate
//
//  Created by Apple on 12/01/23.
//

import Foundation

struct SearchDataModel: Codable {
    let resultCount: Int
    let results: [MusicResults]
}

struct MusicResults: Codable, Hashable, Identifiable {
    let id = UUID()
    let wrapperType: WrapperType?
    let kind: Kind?
    let artistID, collectionID: Int?
    let trackID: Int?
    let artistName: String
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let trackViewURL: String?
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String?
    let collectionPrice, trackPrice: Double?
    let releaseDate: String?
    let collectionExplicitness, trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let isStreamable: Bool?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let hasITunesExtras: Bool?
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras, collectionArtistName
    }

    static func == (lhs: MusicResults, rhs: MusicResults) -> Bool {
        lhs.id == rhs.id
    }
}

enum Explicitness: String, Codable {
    case notExplicit
    case explicit
    case cleaned
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song
    case tvEpisode = "tv-episode"
}

enum WrapperType: String, Codable {
    case track
    case audioBook = "audiobook"
}





class Person{
    
    var age:Int!
    var name:String = "n"
    var address: String!
    
    init(){
        
    }
    
    init(n:String,a:Int,add:String){
        name = n
        age = a
        address = add
    }
}

class Player{
    
    var neeraj = Person()
    var nisha = Person.init(n: "m", a: 8, add: "jhjhb")
}
