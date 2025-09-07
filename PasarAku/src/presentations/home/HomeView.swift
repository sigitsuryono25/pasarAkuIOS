//
//  HomeView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                CarouselView()
                HomeCategoryView()
                AdsListView()
                Spacer()
            }
        }
    }
}

struct HomeCategoryView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 16) {
                ForEach(self.viewModel.category, id: \.self.id) {
                    item in
                    NavigationLink(
                        destination: AdsView(categoryItem: item)
                    ) {
                        VStack {
                            ImageWeb(url: item.iconUrl)
                                .frame(width: 40, height: 40)

                            Text(item.name)
                                .font(.caption)
                                .padding(.top, 2)
                        }
                        .frame(width: 70)
                        .foregroundColor(.primary)
                    }
                }
            }.task {
                await viewModel.fetchCategory()
            }
        }
        .padding(.top)

    }
}

struct CarouselView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<homeViewModel.slider.count, id: \.self) { index in
                ImageWeb(url: homeViewModel.slider[index].cover)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 200)
        .onReceive(timer) { _ in
            withAnimation {
                self.currentIndex =
                    (self.currentIndex + 1) % (homeViewModel.slider.count)
            }
        }
        .task {
            await homeViewModel.fetchSlider()
        }
    }
}

struct AdsListView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var showSheet = false

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        let adsItem = homeViewModel.adsItem
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(adsItem.indices, id: \.self) { index in
                let item = adsItem[index]
                AdsItemView(
                    adsItem: item,
                    onTap: {},
                    onMoreTap: {
                        showSheet = true
                    }
                )
                .onAppear {
                    if index == adsItem.count - 1 {
                        Task {
                            await homeViewModel.loadMoreIfNeeded()
                        }
                    }
                }
                .sheet(
                    isPresented: $showSheet,
                    onDismiss: {
                        showSheet = false
                    }
                ) {}
            }
        }
        .padding()
        .task {
            await homeViewModel.fetchAds()
        }
    }

}

#Preview {
    NavigationStack {
        HomeView()
    }
}
