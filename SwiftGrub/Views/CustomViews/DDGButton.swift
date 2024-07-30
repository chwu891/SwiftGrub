//
//  DDGButton.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/30/24.
//

import SwiftUI

struct DDGButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 280, height: 44)
            .background(Color.theme.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    DDGButton(title: "Test Button")
}
