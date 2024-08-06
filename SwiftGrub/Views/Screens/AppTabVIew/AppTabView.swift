//
//  AppTabView.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/29/24.
//

import SwiftUI

struct AppTabView: View {
    
    @StateObject private var viewModel = AppTabViewModel()
    
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
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .task {
            try? await CloudKitManager.shared.getUserRecord()
            viewModel.checkIfHasSeenOnboard()
        }
        .sheet(isPresented: $viewModel.isShowingOnboardView) {
            OnboardView()
        }
    }
}

#Preview {
    AppTabView()
        .environmentObject(LocationManager())
}
