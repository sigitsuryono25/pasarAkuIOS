//m
//  AdsView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//
import SwiftUI

struct AdsView: View {
    let categoryItem: CategoryItem

    @ObservedObject var adsViewModel: AdsViewModel = AdsViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                let adsItem = adsViewModel.ads
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(adsItem.indices, id: \.self) { index in
                        let item = adsItem[index]
                        AdsItemView(adsItem: item)
                            .onAppear {
                                if index == adsItem.count - 1 {
                                    Task {
                                        await adsViewModel.loadMoreIfNeeded(
                                            categoryId: categoryItem.id)
                                    }
                                }
                            }
                    }
                }
                .padding()
                .task {
                    await adsViewModel.getAdsByCategory(
                        categoryId: self.categoryItem.id)
                }
                .navigationTitle(categoryItem.name)
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
        .accentColor(Color("pasarAkuSecondary"))
    }
}
