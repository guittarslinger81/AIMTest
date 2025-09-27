//
//  CatAPIHelper.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import Foundation

struct CatAPIHelper {
    private let catListBaseUrl = "https://api.thecatapi.com/v1/images/search?limit=23"
    private let catDetailsBaseUrl = "https://api.thecatapi.com/v1/images/"
    private let apiKey = "live_65A3n9K9T1F0BcTuEthMKNQADt63foUGhxb5DxlicDirjh7HyHnEnTCj3ZrWWNv"
    
    func getCatList() -> URLRequest {
        guard let url = URL(string: catListBaseUrl) else {
            return URLRequest(url: URL(string: catListBaseUrl)!)
        }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func getCatDetails(selectedCatId: String) -> URLRequest {
        let fullUrl = catDetailsBaseUrl + selectedCatId
        guard let url = URL(string: fullUrl) else {
            return URLRequest(url: URL(string: fullUrl)!)
        }
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
}
