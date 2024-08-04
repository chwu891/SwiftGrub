//
//  DDGAnnotation.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/4/24.
//

import SwiftUI

struct DDGAnnotation: View {
    var location: DDGLocation
    
    var body: some View {
        VStack {
            ZStack {
                MapBalloon()
                    .frame(width: 100, height: 70)
                    .foregroundColor(Color.theme.brandPrimary)
                
                Image(uiImage: location.createSquareImage())
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .offset(y: -11)
                
                Text("99")
                    .font(.system(size: 11, weight: .bold))
                    .frame(width: 26, height: 18)
                    .background(Color.theme.grubRed)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .offset(x: 20, y: -28)
            }
            
            Text(location.name)
                .font(.caption)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    DDGAnnotation(location: DDGLocation(record: MockData.location))
}
