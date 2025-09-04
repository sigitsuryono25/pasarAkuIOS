//
//  ImageWeb.swift
//  PasarAku
//
//  Created by Sigit Sur on 04/09/25.
//
import SwiftUI

struct ImageWeb: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.2)
                ProgressView()
            }
        }
    }
}
