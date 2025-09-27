//
//  CatDetailView.swift
//  AIMTest
//
//  Created by James Snelling on 9/26/25.
//

import SwiftUI

struct CatDetailView: View {
    var catId: String
    var apiHelper = CatAPIHelper()
    @State private var catDetails = CatDetails()
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Group {
                if isLoading {
                    ProgressView("Loading cat details. Be patient, meow.")
                } else if let errorMessage {
                    Text(errorMessage)
                } else {
                    VStack {
                        Text(catDetails.breeds?.first?.name ?? "Name unavailable")
                            .font(.largeTitle)
                        AsyncImage(url: URL(string: catDetails.url)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                } else if phase.error != nil {
                                    Color.pink
                                } else {
                                    Color.gray
                                }
                        }
                        .frame(width:300, height:300)
                        Spacer()
                        LabeledContent {
                            Text(catDetails.breeds?.first?.weight.imperial ?? "Unavailable")
                        } label: {
                            Text("Weight (in lbs): ")
                        }
                        LabeledContent {
                            Text(catDetails.breeds?.first?.origin ?? "Unavailable")
                        } label: {
                            Text("Origin: ")
                        }
                        LabeledContent {
                            Text(catDetails.breeds?.first?.lifeSpan ?? "Unavailable")
                        } label: {
                            Text("Life Span (in years): ")
                        }
                        Spacer()
                        Text("Temperament:")
                        Spacer()
                        Text(catDetails.breeds?.first?.temperament ?? "Unavailable")
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .task {
            do {
                try await loadSelectedCat(selectedCatId: catId)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    private func loadSelectedCat(selectedCatId: String) async throws {
        isLoading.toggle()
        let request = apiHelper.getCatDetails(selectedCatId: selectedCatId)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(CatDetails.self, from: data)
        print(response)
        catDetails = response
        isLoading.toggle()
    }
}

#Preview {
    CatDetailView(catId: "TuSyTkt2n")
}
