//
//  Rectangle.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

class Rectangle: Shape {
    private var p1: CGPoint
    private var p2: CGPoint
    private var color: UIColor
    private var isFilled: Bool
    
    init(_ p1: CGPoint, _ p2: CGPoint, _ color: UIColor, isFilled: Bool) {
        self.p1 = p1
        self.p2 = p2
        self.color = color
        self.isFilled = isFilled
    }
    
    func drawPath() {
        let origin: CGPoint = CGPoint(x: min(p1.x, p2.x), y: min(p1.y, p2.y))
        let rect = CGRect(origin: origin, size: CGSize(width: abs(p1.x - p2.x), height: abs(p1.y - p2.y)))
        let path = UIBezierPath(rect: rect)
        path.lineWidth = 3
        color.set()
        isFilled ? path.fill() : path.stroke()
    }
}
