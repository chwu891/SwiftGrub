//
//  View+Ext.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/30/24.
//

import SwiftUI

extension View {
    func profileNameStyle() -> some View {
        self.modifier(ProfileNameText())
    }
    
    func embedInScrollView() -> some View {
        GeometryReader { geometry in
            ScrollView {
                self.frame(minHeight: geometry.size.height, maxHeight: .infinity)
            }
        }
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
