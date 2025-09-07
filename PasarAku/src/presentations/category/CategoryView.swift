//
//  CategoryView.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel = CategoryViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.category, id: \.id) {
                        item in
                        NavigationLink(destination: AdsView(categoryItem: item)) {
                            HStack {
                                ImageWeb(url: item.iconUrl).frame(
                                    width: 40, height: 40)
                                Text(item.name)
                                    .foregroundColor(.black)
                                    .font(.callout)
                                Spacer()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("All Categories")
                .navigationBarTitleDisplayMode(.automatic)
                .task {
                    await viewModel.fetchCategory()
                }
            }
        }
    }
}
