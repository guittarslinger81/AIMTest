//
//  TestData.swift
//  AIMTestTests
//
//  Created by James Snelling on 9/27/25.
//

import Foundation

let testCatListData: Data = """
[
  {
    "id": "vH0bd0YDH",
    "url": "https://cdn2.thecatapi.com/images/vH0bd0YDH.jpg",
    "width": 1335,
    "height": 1206,
    "breeds": [
      {
        "weight": {
          "imperial": "7 - 16",
          "metric": "3 - 7"
        },
        "id": "abob",
        "name": "American Bobtail",
        "temperament": "Intelligent, Interactive, Lively, Playful, Sensitive",
        "origin": "United States",
        "country_codes": "US",
        "country_code": "US",
        "life_span": "11 - 15",
        "wikipedia_url": "https://en.wikipedia.org/wiki/American_Bobtail"
      }
    ]
  },
  {
    "id": "xNuSF5YWY",
    "url": "https://cdn2.thecatapi.com/images/xNuSF5YWY.jpg",
    "width": 850,
    "height": 477,
    "breeds": [
      {
        "weight": {
          "imperial": "12 - 20",
          "metric": "5 - 9"
        },
        "id": "bsho",
        "name": "British Shorthair",
        "temperament": "Affectionate, Easy Going, Gentle, Loyal, Patient, calm",
        "origin": "United Kingdom",
        "country_codes": "GB",
        "country_code": "GB",
        "life_span": "12 - 17",
        "wikipedia_url": "https://en.wikipedia.org/wiki/British_Shorthair"
      }
    ]
  },
  {
    "id": "_7U4xGLO_",
    "url": "https://cdn2.thecatapi.com/images/_7U4xGLO_.jpg",
    "width": 800,
    "height": 879,
    "breeds": [
      {
        "weight": {
          "imperial": "12 - 20",
          "metric": "5 - 9"
        },
        "id": "bsho",
        "name": "British Shorthair",
        "temperament": "Affectionate, Easy Going, Gentle, Loyal, Patient, calm",
        "origin": "United Kingdom",
        "country_codes": "GB",
        "country_code": "GB",
        "life_span": "12 - 17",
        "wikipedia_url": "https://en.wikipedia.org/wiki/British_Shorthair"
      }
    ]
  },
  {
    "id": "92D9NZLs0",
    "url": "https://cdn2.thecatapi.com/images/92D9NZLs0.jpg",
    "width": 3260,
    "height": 1685,
    "breeds": [
      {
        "weight": {
          "imperial": "6 - 12",
          "metric": "3 - 5"
        },
        "id": "bure",
        "name": "Burmese",
        "temperament": "Curious, Intelligent, Gentle, Social, Interactive, Playful, Lively",
        "origin": "Burma",
        "country_codes": "MM",
        "country_code": "MM",
        "life_span": "15 - 16",
        "wikipedia_url": "https://en.wikipedia.org/wiki/Burmese_(cat)"
      }
    ]
  }
]
""".data(using: .utf8)!

let testCatDetailsData: Data = """
{
  "id": "H_UWbOfra",
  "width": 1200,
  "height": 1200,
  "url": "https://cdn2.thecatapi.com/images/H_UWbOfra.jpg",
  "breeds": [
    {
      "weight": {
        "imperial": "6 - 12",
        "metric": "3 - 7"
      },
      "id": "beng",
      "name": "Bengal",
      "temperament": "Alert, Agile, Energetic, Demanding, Intelligent",
      "origin": "United States",
      "country_codes": "US",
      "country_code": "US",
      "life_span": "12 - 15",
      "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_(cat)"
    }
  ]
}
""".data(using: .utf8)!
