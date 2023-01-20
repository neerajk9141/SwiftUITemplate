//
//  TestCases.swift
//  SwiftUiTemplateTests
//
//  Created by Apple on 19/01/23.
//

import XCTest
import Combine
@testable import SwiftUiTemplate

final class TestCases: XCTestCase {
    
    private var model: SearchDataModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockModelBinding()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func mockModelBinding(){
        model = SearchDataModel(resultCount: 1, results: [MusicResults(wrapperType: WrapperType.audioBook, kind: Kind.song, artistID: 25, collectionID: 26, trackID: 27, artistName: "Test Artist", collectionName: "Test Collection", trackName: "Test track name", collectionCensoredName: "censored", trackCensoredName: "track censored", artistViewURL: "https://abc.xyz.com", collectionViewURL: "https://abc.xyz.com", trackViewURL: "https://abc.xyz.com", previewURL: "https://abc.xyz.com", artworkUrl30: "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png", artworkUrl60: "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png", artworkUrl100: "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png", collectionPrice: 20.0, trackPrice: 20, releaseDate: "", collectionExplicitness: Explicitness.cleaned, trackExplicitness: .notExplicit, discCount: 1, discNumber: 1, trackCount: 2, trackNumber: 1, trackTimeMillis: 55, country: .usa, currency: .usd, primaryGenreName: "Song", isStreamable: false, collectionArtistID: 10, collectionArtistViewURL: "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png", trackRentalPrice: 50, collectionHDPrice: 50, trackHDPrice: 50, trackHDRentalPrice: 50, contentAdvisoryRating: "5", shortDescription: "", longDescription: "long desc", hasITunesExtras: false, collectionArtistName: "coll artist name")])
        
        
    }
    
    func testKind() throws{
        XCTAssertEqual(self.model?.results.first?.kind, .song)
        XCTAssertEqual(self.model?.results.first?.wrapperType,.audioBook)
        XCTAssertEqual(self.model?.results.first?.artistID, 25)
        XCTAssertEqual(self.model?.results.first?.collectionID, 26)
        XCTAssertEqual(self.model?.results.first?.trackID, 27)
        XCTAssertEqual(self.model?.results.first?.artistName, "Test Artist")
        XCTAssertEqual(self.model?.results.first?.collectionName, "Test Collection")
        XCTAssertEqual(self.model?.results.first?.trackName, "Test track name")
        XCTAssertEqual(self.model?.results.first?.collectionCensoredName, "censored")
        XCTAssertEqual(self.model?.results.first?.trackCensoredName, "track censored")
        XCTAssertEqual(self.model?.results.first?.artistViewURL, "https://abc.xyz.com")
        XCTAssertEqual(self.model?.results.first?.collectionViewURL, "https://abc.xyz.com")
        XCTAssertEqual(self.model?.results.first?.trackViewURL, "https://abc.xyz.com")
        XCTAssertEqual(self.model?.results.first?.previewURL, "https://abc.xyz.com")
        XCTAssertEqual(self.model?.results.first?.artworkUrl30, "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png")
        XCTAssertEqual(self.model?.results.first?.artworkUrl60, "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png")
        XCTAssertEqual(self.model?.results.first?.artworkUrl100, "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png")
        XCTAssertEqual(self.model?.results.first?.collectionPrice, 20.0)
        XCTAssertEqual(self.model?.results.first?.trackPrice, 20)
        XCTAssertEqual(self.model?.results.first?.releaseDate, "")
        XCTAssertEqual(self.model?.results.first?.collectionExplicitness, Explicitness.cleaned)
        XCTAssertEqual(self.model?.results.first?.trackExplicitness, .notExplicit)
        XCTAssertEqual(self.model?.results.first?.discCount, 1)
        XCTAssertEqual(self.model?.results.first?.discNumber, 1)
        XCTAssertEqual(self.model?.results.first?.trackCount, 2)
        XCTAssertEqual(self.model?.results.first?.trackNumber, 1)
        XCTAssertEqual(self.model?.results.first?.trackTimeMillis, 55)
        XCTAssertEqual(self.model?.results.first?.country, .usa)
        XCTAssertEqual(self.model?.results.first?.currency, .usd)
        XCTAssertEqual(self.model?.results.first?.primaryGenreName, "Song")
        XCTAssertEqual(self.model?.results.first?.isStreamable, false)
        XCTAssertEqual(self.model?.results.first?.collectionArtistID, 10)
        XCTAssertEqual(self.model?.results.first?.collectionArtistViewURL, "https://w7.pngwing.com/pngs/50/495/png-transparent-musical-note-musical-notation-musical-theatre-music-note-text-logo-music-note-thumbnail.png")
        XCTAssertEqual(self.model?.results.first?.trackRentalPrice, 50)
        XCTAssertEqual(self.model?.results.first?.collectionHDPrice, 50)
        XCTAssertEqual(self.model?.results.first?.trackHDPrice, 50)
        XCTAssertEqual(self.model?.results.first?.trackHDRentalPrice, 50)
        XCTAssertEqual(self.model?.results.first?.contentAdvisoryRating, "5")
        XCTAssertEqual(self.model?.results.first?.shortDescription, "")
        XCTAssertEqual(self.model?.results.first?.longDescription, "long desc")
        XCTAssertEqual(self.model?.results.first?.hasITunesExtras, false)
        XCTAssertEqual(self.model?.results.first?.collectionArtistName, "coll artist name")
    }
    
    func testEmptySearch() throws {
        let expectation = XCTestExpectation(description: "one value")
        ApiManager().getSongs(for: "")
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                    expectation.fulfill()
                },
                receiveValue: { value in
                    guard let results = value?.results, results.isEmpty else {
                        return XCTFail("results count found: (\(value?.resultCount ?? 0))")
                    }
                    XCTAssertFalse(results.count > 0)
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 0.5)
        
    }
    
    func testSearch() throws {
        let expectation = XCTestExpectation(description: "one value")
        ApiManager().getSongs(for: "perfect")
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                    expectation.fulfill()
                },
                receiveValue: { value in
                    guard let results = value?.results, !results.isEmpty else {
                        return XCTFail("results count found: (\(value?.resultCount ?? 0))")
                    }
                    XCTAssertTrue(results.count > 0)
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 2.5)
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
