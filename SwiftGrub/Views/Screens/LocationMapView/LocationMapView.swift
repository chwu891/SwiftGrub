//
//  LocationView.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/29/24.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate, tint: .brandPrimary)
            }
            .accentColor(Color.theme.grubRed)
            .ignoresSafeArea()
            
            VStack {
                LogoView(frameWidth: 125).shadow(radius: 10)
                Spacer()
            }
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }
    }
}

#Preview {
    LocationMapView()
        .environmentObject(LocationManager())
}
