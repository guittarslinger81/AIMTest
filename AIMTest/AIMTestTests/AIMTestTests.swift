//
//  AIMTestTests.swift
//  AIMTestTests
//
//  Created by James Snelling on 9/26/25.
//

import Testing
import XCTest
@testable import AIMTest

struct AIMTestTests {

    @Test func testCatDecoderDecodesCatsList() async throws {
        let decoder = JSONDecoder()
        let cats = try decoder.decode([CatImage].self, from: testCatListData)
        #expect(cats.first?.breeds?.first?.name == "American Bobtail")
        #expect(cats.first?.breeds?.first?.weight.imperial == "7 - 16")
        #expect(cats.first?.id == "vH0bd0YDH")
        #expect(cats.first?.url == "https://cdn2.thecatapi.com/images/vH0bd0YDH.jpg")
        #expect(cats[1].breeds?.first?.name == "British Shorthair")
        #expect(cats[1].breeds?.first?.weight.imperial == "12 - 20")
        #expect(cats[1].id == "xNuSF5YWY")
        #expect(cats[1].url == "https://cdn2.thecatapi.com/images/xNuSF5YWY.jpg")
        #expect(cats[2].breeds?.first?.name == "British Shorthair")
        #expect(cats[2].breeds?.first?.weight.metric == "5 - 9")
        #expect(cats[2].id == "_7U4xGLO_")
        #expect(cats[2].url == "https://cdn2.thecatapi.com/images/_7U4xGLO_.jpg")
        #expect(cats[3].breeds?.first?.name == "Burmese")
        #expect(cats[3].breeds?.first?.weight.metric == "3 - 5")
        #expect(cats[3].id == "92D9NZLs0")
        #expect(cats[3].url == "https://cdn2.thecatapi.com/images/92D9NZLs0.jpg")
    }
    
    @Test func testCatDecoderDecodesCatDetails() async throws {
        let decoder = JSONDecoder()
        let cat = try decoder.decode(CatDetails.self, from: testCatDetailsData)
        #expect(cat.id == "H_UWbOfra")
        #expect(cat.width == 1200)
        #expect(cat.height == 1200)
        #expect(cat.url == "https://cdn2.thecatapi.com/images/H_UWbOfra.jpg")
        #expect(cat.breeds?.first?.name == "Bengal")
        #expect(cat.breeds?.first?.id == "beng")
        #expect(cat.breeds?.first?.temperament == "Alert, Agile, Energetic, Demanding, Intelligent")
        #expect(cat.breeds?.first?.origin == "United States")
        #expect(cat.breeds?.first?.countryCodes == "US")
        #expect(cat.breeds?.first?.countryCode == "US")
        #expect(cat.breeds?.first?.lifeSpan == "12 - 15")
        #expect(cat.breeds?.first?.wikipediaUrl ==  "https://en.wikipedia.org/wiki/Bengal_(cat)")
        #expect(cat.breeds?.first?.weight.imperial == "6 - 12")
        #expect(cat.breeds?.first?.weight.metric == "3 - 7")
    }
}
