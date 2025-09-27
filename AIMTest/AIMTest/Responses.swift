//
//  Response.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import Foundation

struct CatImage: Codable, Identifiable, Hashable {
    var id: String
    var url: String
    var width: Int
    var height: Int
    var breeds: [CatBreed]?
    var favourite: Favourite?
    var vote: Vote?
}

struct CatDetails: Codable, Identifiable, Hashable {
    var id: String
    var width: Int
    var height: Int
    var url: String
    var breeds: [CatBreed]?
    
    //default info for previews/initial page load
    init() {
        id = "cat"
        width = 1205
        height = 1445
        url = "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"
        breeds = [CatBreed(
            weight: Weight(imperial: "130 lbs", metric: "58.9 kg"),
            id: "cat",
            name: "The Test Cat",
            temperament: "Neurospicy",
            origin: "SoCal, bro",
            countryCodes: "US",
            countryCode: "US",
            lifeSpan: "Infinite",
            wikipediaUrl: "https://www.imdb.com/name/nm11352930/"
        )]
    }
}

struct CatBreed: Codable, Identifiable, Equatable, Hashable {
    var weight: Weight
    var id: String
    var name: String
    var temperament: String
    var origin: String
    var countryCodes: String
    var countryCode: String
    var lifeSpan: String
    var wikipediaUrl: String
    
    enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case id = "id"
        case name = "name"
        case temperament = "temperament"
        case origin = "origin"
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case lifeSpan = "life_span"
        case wikipediaUrl = "wikipedia_url"
    }
}

struct Weight: Codable, Equatable, Hashable {
    var imperial: String
    var metric: String
}

//data not used in app - blank stubs for comformity
struct Favourite: Codable, Equatable, Hashable {
    
}

struct Vote: Codable, Equatable, Hashable {
    
}
