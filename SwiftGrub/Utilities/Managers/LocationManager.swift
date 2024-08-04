//
//  LocationManager.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/1/24.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
    var selectedLocation: DDGLocation?
}
