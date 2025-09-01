//
//  ContentView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(height: 120)
                        .padding(.horizontal, 50)

                    Spacer()
                    Text("Version 1.0.0")
                        .font(.caption)
                }.onAppear {
                    timer()
                }
            } else {
                MainView()
            }
        }
    }

    private func timer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showSplash = false
            }
        }
    }
}

#Preview {
    ContentView()
}
