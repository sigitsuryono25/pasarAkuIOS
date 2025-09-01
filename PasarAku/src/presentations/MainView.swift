//
//  MainView.swift
//  PasarAku
//
//  Created by Sigit Sur on 01/09/25.
//
import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        if selectedTab == 0 {
                            Image("ic_dashboard")
                                .renderingMode(.template)
                        } else {

                            Image("ic_dashboard_outline")
                                .renderingMode(.template)
                        }
                        Text("Home")
                    }.tag(0)

                ChatView()
                    .tabItem {
                        if selectedTab == 1 {
                            Image("ic_chat")
                                .renderingMode(.template)
                        } else {
                            Image("ic_chat_outline")
                                .renderingMode(.template)
                        }
                        Text("Chats")
                    }.tag(1)

                AdsView()
                    .tabItem {
                        if selectedTab == 2 {
                            Image("ic_list").renderingMode(.template)
                        } else {
                            Image("ic_list_outline").renderingMode(.template)
                        }
                        Text("Ads")
                    }.tag(2)

                ProfileView()
                    .tabItem {
                        if selectedTab == 3 {
                            Image("ic_user")
                                .renderingMode(.template)
                        } else {
                            Image("ic_user_outline")
                                .renderingMode(.template)
                        }
                        Text("Profile")
                    }.tag(3)

            }
            .accentColor(Color("pasarAkuSecondary"))
        }
        .background(.white)
    }
}

#Preview {
    MainView()
}
