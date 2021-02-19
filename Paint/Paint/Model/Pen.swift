//
//  Pen.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

class Pen: Shape {
    private var points: [CGPoint]
    private var color: UIColor
    
    init(_ p1: CGPoint, _ color: UIColor) {
        self.points = [p1]
        self.color = color
    }
    
    func addPoint(point: CGPoint) {
        points.append(point)
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: points[0])
        for i in 1..<points.count {
            path.addLine(to: points[i])
        }
        color.set()
        path.lineWidth = 3
        path.stroke()
    }
}
