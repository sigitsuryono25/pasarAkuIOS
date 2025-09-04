//
//  CategoryViewModel.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import Foundation

class CategoryViewModel: ObservableObject {
    @Published var category: [CategoryItem] = []
    private let apiService: ApiService

    init(apiService: ApiService = container.resolve(ApiService.self)!) {
        self.apiService = apiService
    }

    @MainActor
    func fetchCategory() async {
        do {
            let response = try await apiService.getCategories()
            self.category = response.toDomainList()
        } catch {
            print("Error: \(error)")
        }
    }
}
