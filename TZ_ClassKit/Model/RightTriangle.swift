//
//  RightTriangle.swift
//  TZ_ClassKit
//
//  Created by bakebrlk on 08.10.2024.
//

import SwiftUI

struct RightTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))

        return path
    }
}
