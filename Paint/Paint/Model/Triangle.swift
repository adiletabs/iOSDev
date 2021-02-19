//
//  Triangle.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

class Triangle: Shape {
    private var p1: CGPoint
    private var p2: CGPoint
    private var p3: CGPoint
    private var color: UIColor
    private var isFilled: Bool
    
    init(_ p1: CGPoint, _ p2: CGPoint, _ color: UIColor, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = CGPoint(x: p1.x, y: p2.y)
        self.color = color
        self.isFilled = isFilled
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p1)
        path.lineWidth = 3
        color.set()
        isFilled ? path.fill() : path.stroke()
    }
}
