//
//  Circle.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

class Circle: Shape {
    private var radius: CGFloat
    private var circleCenter: CGPoint
    private var color: UIColor
    private var isFilled: Bool
    
    init(_ radius: CGFloat, _ circleCenter: CGPoint, _ color: UIColor, isFilled: Bool) {
        self.radius = radius
        self.circleCenter = circleCenter
        self.color = color
        self.isFilled = isFilled
    }
    
    func drawPath() {
        let path = UIBezierPath(arcCenter: circleCenter,
                                radius: radius,
                                startAngle: 0,
                                endAngle: 2 * Double.pi.cg,
                                clockwise: true)
        path.lineWidth = 3
        color.set()
        isFilled ? path.fill() : path.stroke()
    }
}
