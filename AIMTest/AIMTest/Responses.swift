//
//  Response.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import Foundation

struct CatImage: Codable, Identifiable {
    var id: String
    var url: String
    var width: Int
    var height: Int
}

struct CatDetails: Codable, Identifiable {
    var id: String
    var width: Int
    var height: Int
    var url: String
    var breeds: [CatBreed]
}

struct CatBreed: Codable {
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

struct Weight: Codable {
    var imperial: String
    var metric: String
}
