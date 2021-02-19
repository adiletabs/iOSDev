//
//  Triangle.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

class Line: Shape {
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    
    init(_ p1: CGPoint, _ p2: CGPoint, _ color: UIColor) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
    }
    
    func drawPath() {
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.lineWidth = 3
        color.set()
        path.stroke()
    }
}
