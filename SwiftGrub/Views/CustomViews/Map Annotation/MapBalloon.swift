//
//  MapBalloon.swift
//  SwiftGrub
//
//  Created by Chi-Hsien Wu on 8/4/24.
//

import SwiftUI

struct MapBalloon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}

#Preview {
    MapBalloon()
        .frame(width: 300, height: 240)
        .foregroundColor(Color.theme.brandPrimary)
}
