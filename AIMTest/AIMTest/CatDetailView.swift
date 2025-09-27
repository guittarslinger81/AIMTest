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
                    ProgressView("Loading this awesome cat. Be patient, meow.")
                } else if let errorMessage {
                    Text(errorMessage)
                } else {
                    VStack {
                        Text(catDetails.breeds?.first?.name ?? "Name unavailable")
                            .font(.largeTitle)
                        AsyncImage(url: URL(string: catDetails.url)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                } else if phase.error != nil {
                                    Color.red
                                } else {
                                    Color.gray
                                }
                        }
                        .frame(width:300, height:300)
                        Spacer().frame(height: 25)
                        LabeledContent {
                            Text(catDetails.breeds?.first?.weight.imperial ?? "Unavailable")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.black)
                        } label: {
                            Text("Weight (in lbs): ")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.purple)
                        }
                        LabeledContent {
                            Text(catDetails.breeds?.first?.origin ?? "Unavailable")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.black)
                        } label: {
                            Text("Origin: ")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.purple)
                        }
                        LabeledContent {
                            Text(catDetails.breeds?.first?.lifeSpan ?? "Unavailable")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.black)
                        } label: {
                            Text("Life Span (in years): ")
                                .padding(.horizontal, 20)
                                .foregroundStyle(.purple)
                        }
                        Spacer().frame(height: 25)
                        Text("Temperament:")
                            .foregroundStyle(.purple)
                            .font(.headline)
                        Spacer().frame(height: 10)
                        Text(catDetails.breeds?.first?.temperament ?? "Unavailable")
                            .padding(.horizontal, 20)
                        Spacer().frame(height: 50)
                        Text("Learn more about \(catDetails.breeds?.first?.name ?? "Name unavailable")")
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                if let url = URL(string: catDetails.breeds?.first?.wikipediaUrl ?? "https://en.wikipedia.org/wiki/Cat") {
                                                UIApplication.shared.open(url)
                                            }
                                        }
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
    
    //get the selected cat's details
    private func loadSelectedCat(selectedCatId: String) async throws {
        isLoading.toggle()
        let request = apiHelper.getCatDetails(selectedCatId: selectedCatId)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(CatDetails.self, from: data)
        catDetails = response
        isLoading.toggle()
    }
}

#Preview {
    CatDetailView(catId: "TuSyTkt2n")
}
