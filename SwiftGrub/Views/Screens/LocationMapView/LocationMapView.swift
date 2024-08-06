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
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapAnnotation(coordinate: location.location.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.75)) {
                    DDGAnnotation(location: location,
                                  number: viewModel.checkedInProfiles[location.id, default: 0])
                        .onTapGesture {
                            locationManager.selectedLocation = location
                            viewModel.isShowingDetailView = true
                        }
                }
            }
            .tint(Color.theme.grubRed)
            .ignoresSafeArea()
           
            LogoView(frameWidth: 125).shadow(radius: 10)
        }
        .sheet(isPresented: $viewModel.isShowingDetailView) {
            NavigationView {
                viewModel.createLocationDetailView(for: locationManager.selectedLocation!, in: dynamicTypeSize)
                    .toolbar {
                        Button("Dismiss", action: { viewModel.isShowingDetailView = false })
                    }
            }
        }
        .alert(item: $viewModel.alertItem, content: { $0.alert })
        .onAppear {
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
            viewModel.getCheckedInCounts()
        }
    }
}

#Preview {
    LocationMapView()
        .environmentObject(LocationManager())
}
