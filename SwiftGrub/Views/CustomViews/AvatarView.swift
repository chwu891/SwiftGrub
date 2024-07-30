//
//  AvatarView.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 7/30/24.
//

import SwiftUI

struct AvatarView: View {
    
    var size: CGFloat
    
    var body: some View {
        Image("default-avatar")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

#Preview {
    AvatarView(size: 90)
}
