//
//  LogoView.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/1/24.
//

import SwiftUI

struct LogoView: View {
    
    var frameWidth: CGFloat
    
    var body: some View {
        Image(decorative: "ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
    }
}

#Preview {
    LogoView(frameWidth: 250)
}
