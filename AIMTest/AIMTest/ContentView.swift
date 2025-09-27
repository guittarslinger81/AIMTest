//
//  ContentView.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var catListResults: [CatImage] = []
    private var apiHelper = CatAPIHelper()
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading cats. Be patient, meow.")
                } else if let errorMessage {
                    Text(errorMessage)
                } else {
                    
                }
            }
        }
    }
    
    private func loadCatsList() async throws {
        isLoading.toggle()
        let request = apiHelper.getCatList()
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode([CatImage].self, from: data)
        catListResults = response
        isLoading.toggle()
    }
    
    private func loadSelectedCat(selectedCatId: String) async throws -> CatDetails{
        isLoading.toggle()
        let request = apiHelper.getCatDetails(selectedCatId: selectedCatId)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(CatDetails.self, from: data)
        let catDetails = response
        isLoading.toggle()
        return catDetails
    }
}

#Preview {
    ContentView()
}
