//
//  LocationListViewModel.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/3/24.
//

import CloudKit
import SwiftUI
import Observation

extension LocationListView {
    
    @MainActor @Observable
    final class LocationListViewModel: ObservableObject {
        
        var checkedInProfiles: [CKRecord.ID: [DDGProfile]] = [:]
        var alertItem: AlertItem?
        
        func getCheckedInProfilesDictionary() async {
            Task {
                do {
                    checkedInProfiles = try await CloudKitManager.shared.getCheckedInProfilesDictionary()
                } catch {
                    alertItem = AlertContext.unableToGetAllCheckedInProfiles
                }
            }
        }
        
        func createVoiceOverSummary(for location: DDGLocation) -> String {
            let count = checkedInProfiles[location.id, default: []].count
            let personPlurality = count == 1 ? "person" : "people"
            
            return "\(location.name) \(count) \(personPlurality) checked in"
        }
        
        @ViewBuilder func createLocationDetailView(for location: DDGLocation, in dynamicTypeSize: DynamicTypeSize) -> some View {
            if dynamicTypeSize >= .accessibility3 {
                LocationDetailView(viewModel: LocationDetailView.LocationDetailViewModel(location: location)).embedInScrollView()
            } else {
                LocationDetailView(viewModel: LocationDetailView.LocationDetailViewModel(location: location))
            }
        }
    }

}
