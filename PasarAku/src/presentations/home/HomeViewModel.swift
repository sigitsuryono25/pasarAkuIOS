//
//  HomeViewModel.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import Foundation

class HomeViewModel: BaseViewModel {
    @Published var slider: [SliderItem] = []
    @Published var category: [CategoryItem] = []
    @Published var adsItem: [AdsItem] = []

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
    func fetchCategory() async {
        do {
            let response = try await apiService.getCategories()
            self.category = response.toDomainList()
        } catch {
            print("Error: \(error)")
        }
    }

    @MainActor
    func fetchAds() async {
        currentPage = 0
        await fetchAdsPagination()
    }

    func loadMoreIfNeeded() async {
        if hasMoreData {
            currentPage += 1
            await fetchAdsPagination()
        }
    }

    @MainActor
    private func fetchAdsPagination() async {
        do {
            let response = try await apiService.getAds(page: "\(currentPage)")
            hasMoreData = response.dataIklan?.isEmpty == false

            if hasMoreData {
                self.adsItem.append(contentsOf: response.toDomainList())
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
