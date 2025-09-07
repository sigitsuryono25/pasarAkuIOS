//
//  MainView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//
import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        if selectedTab == 0 {
                            ImageSvg(svg: "ic_dashboard")
                        } else {
                            ImageSvg(svg: "ic_dashboard_outline")
                        }
                        Text("Home")
                    }.tag(0)

                Color.clear
                    .tabItem {
                        if selectedTab == 1 {
                            ImageSvg(svg: "ic_chat")
                        } else {
                            ImageSvg(svg: "ic_chat_outline")
                        }
                        Text("Chats")
                    }.tag(1)

                Color.clear
                    .tabItem {
                        if selectedTab == 2 {
                            ImageSvg(svg: "ic_list")
                        } else {
                            ImageSvg(svg: "ic_list_outline")
                        }
                        Text("Ads")
                    }.tag(2)

                Color.clear
                    .tabItem {
                        if selectedTab == 3 {
                            ImageSvg(svg: "ic_user")
                        } else {
                            ImageSvg(svg: "ic_user_outline")
                        }
                        Text("Profile")
                    }.tag(3)

            }
            .onChange(of: selectedTab) { oldValue, newValue in
                if [1, 2, 3].contains(newValue) {
                    showSheet = true
                    selectedTab = 0
                }
            }
        }
        .accentColor(Color("pasarAkuSecondary"))
        .background(.white)
        .sheet(
            isPresented: $showSheet,
            onDismiss: {
                showSheet = false
                selectedTab = 0
            }
        ) {
            LoginView(showSheet: $showSheet)
        }
    }
}

#Preview {
    MainView()
}
