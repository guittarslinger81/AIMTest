//
//  CatAPIHelper.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import Foundation

struct CatAPIHelper {
    private let catListBaseUrl = "https://api.thecatapi.com/v1/images/search?has_breeds=1&limit=23"
    private let catDetailsBaseUrl = "https://api.thecatapi.com/v1/images/"
    private let apiKey = "live_7mfWa25LBhWKM3wTZAzUudObt9Cz84xPI2iO6UUQqjm7T5opHV51kFks4Gscho5M"
    
    func getCatList() -> URLRequest {
        guard let url = URL(string: catListBaseUrl) else {
            return URLRequest(url: URL(string: catListBaseUrl)!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func getCatDetails(selectedCatId: String) -> URLRequest {
        let fullUrl = catDetailsBaseUrl + selectedCatId
        guard let url = URL(string: fullUrl) else {
            return URLRequest(url: URL(string: fullUrl)!)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
}
