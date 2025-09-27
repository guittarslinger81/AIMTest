//
//  CatAPIHelper.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import Foundation

struct CatAPIHelper {
    
    //list base url - modified to search only for cats with breed info (name, etc) for ux.
    //the provided api endpoint returned a lot of results that did not have breed info, so all the data was blank.
    //i do not think that would've provided a good user experience, so i figured out how to change the search.
    private let catListBaseUrl = "https://api.thecatapi.com/v1/images/search?has_breeds=1&limit=23"
    
    //details base url
    private let catDetailsBaseUrl = "https://api.thecatapi.com/v1/images/"
    
    //had to get my own api key. the key provided did not allow for detailed data, fyi.
    private let apiKey = "live_7mfWa25LBhWKM3wTZAzUudObt9Cz84xPI2iO6UUQqjm7T5opHV51kFks4Gscho5M"
    
    //build request for list
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
    
    //build request for details
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
