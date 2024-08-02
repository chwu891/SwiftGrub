//
//  AppTabView.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/29/24.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            LocationListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .onAppear{
            CloudKitManager.shared.getUserReocrd()
        }
        .accentColor(Color.theme.brandPrimary)
    }
}

#Preview {
    AppTabView()
        .environmentObject(LocationManager())
}
