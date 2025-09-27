//
//  ContentView.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var catListResults: [CatImage] = []
    @State private var catDetailsList: [CatDetails] = []
    private var apiHelper = CatAPIHelper()
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var selectedCat = CatDetails()
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading cats. Be patient, meow.")
                } else if let errorMessage {
                    Text(errorMessage)
                } else {
                    Text("Random Cat Generator")
                        .font(.subheadline)
                    List(catListResults, id: \.self) { cat in
                        NavigationLink(destination: CatDetailView(catId: cat.id)) {
                            HStack {
                                AsyncImage(url: URL(string: cat.url)) { phase in
                                    if let image = phase.image {
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                        } else if phase.error != nil {
                                            Color.pink
                                        } else {
                                            Color.gray
                                        }
                                }
                                .frame(width:100, height:100)
                                Spacer()
                                Text(cat.breeds?.first?.name ?? "Unavailable")
                                    .font(.headline)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Cats Are THE Best")
            .task {
                do {
                    try await loadCatsList()
                } catch {
                    errorMessage = error.localizedDescription
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
}

#Preview {
    ContentView()
}
