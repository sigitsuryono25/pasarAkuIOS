//
//  HomeView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CarouselView()
                    HomeCategoryView()
                    AdsView()
                    Spacer()
                }
            }
        }
    }
}

struct HomeCategoryView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(alignment: .trailing) {
            NavigationLink(
                destination: CategoryView()
            ) {
                Text("View all")
                    .font(.callout)
                    .padding(.bottom, 16)
                    .foregroundColor(Color("pasarAkuSecondary"))
            }

            HStack {
                ForEach(self.viewModel.category.prefix(3), id: \.self.id) {
                    item in
                    NavigationLink(
                        destination: Text(item.name).toolbar(
                            .hidden, for: .tabBar)
                    ) {
                        VStack {
                            ImageWeb(url: item.iconUrl)
                                .frame(width: 40, height: 40)

                            Text(item.name)
                                .font(.caption)
                                .padding(.top, 2)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.task {
                await viewModel.fetcCategory()
            }
        }
        .padding()
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
    var body: some View {
        Text("AdsListView")
    }
}
