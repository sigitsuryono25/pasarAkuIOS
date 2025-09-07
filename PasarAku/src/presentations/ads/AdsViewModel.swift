//
//  AdsViewModel.swift
//  PasarAku
//
//  Created by Sigit Sur on 07/09/25.
//
import Foundation

class AdsViewModel: BaseViewModel {
    @Published var ads: [AdsItem] = []

    @MainActor
    func getAdsByCategory(categoryId: String) async {
        currentPage = 0
        await fetchAdsByCategory(categoryId: categoryId)
    }

    func loadMoreIfNeeded(categoryId: String) async {
        if hasMoreData {
            currentPage += 1
            await fetchAdsByCategory(categoryId: categoryId)
        }
    }

    @MainActor
    private func fetchAdsByCategory(categoryId: String) async {
        do {
            let ads = try await apiService.getAdsByCategory(
                categoryId: categoryId, page: "\(currentPage)")

            hasMoreData = ads.dataIklan?.isEmpty == false

            if hasMoreData {
                self.ads.append(contentsOf: ads.toDomainList())
            }
        } catch {
            print("Error \(error)")
        }
    }
}
