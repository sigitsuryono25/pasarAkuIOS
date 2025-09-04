//
//  HomeViewModel.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import Foundation

class HomeViewModel: ObservableObject {
    @Published var slider: [SliderItem] = []
    @Published var category: [CategoryItem] = []

    private let apiService: ApiService

    init(apiService: ApiService = container.resolve(ApiService.self)!) {
        self.apiService = apiService
    }

    @MainActor
    func fetchSlider() async {
        do {
            let response = try await apiService.getSlider()
            self.slider = response.toDomainList()
        } catch {
            print("Error: \(error)")
        }
    }

    @MainActor
    func fetcCategory() async {
        do {
            let response = try await apiService.getCategories()
            self.category = response.toDomainList()
        } catch {
            print("Error: \(error)")
        }
    }
}
