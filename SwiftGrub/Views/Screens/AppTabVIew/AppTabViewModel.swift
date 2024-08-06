//
//  AppTabViewModel.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/4/24.
//

import SwiftUI

extension AppTabView {
    
    final class AppTabViewModel: NSObject, ObservableObject {
        @Published var isShowingOnboardView = false
        @AppStorage("hasSeenOnboardView") var hasSeenOnboardView = false {
            didSet { isShowingOnboardView = hasSeenOnboardView }
        }
        
        let kHasSeenOnboardView = "hasSeenOnboardView"
        
        func checkIfHasSeenOnboard() {
            if !hasSeenOnboardView { hasSeenOnboardView = true }
        }
    }
}

