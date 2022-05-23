//
//  EMPie.swift
//  Emoji Match
//
//  Created by Munirathinam, Anish | RIEPL on 23/05/22.
//

import SwiftUI

struct EMPie: Shape {

    var startAngle: Angle
    var endAngel: Angle
    var clockwise = false

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startPoint = CGPoint(x: center.x + radius * cos(startAngle.radians),
                                 y: center.y + radius * sin(startAngle.radians))
        var path = Path()
        path.move(to: center)
        path.addLine(to: startPoint)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngel, clockwise: !clockwise)
        path.addLine(to: center)
        return path
    }
}
