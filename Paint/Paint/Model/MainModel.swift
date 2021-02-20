//
//  MainModel.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import Foundation
import UIKit

enum CurrentMode {
    case Circle
    case Rectangle
    case Triangle
    case Line
    case Pen
}

class MainModel {
    private var shapes: [Shape] = []
    private var currentShape: Shape?
    private var currentMode: CurrentMode = .Circle
    private var currentColor: UIColor = .black
    private var fill: Bool = true
    private var startPoint: CGPoint?
    
    func drawShapes() {
        for shape in shapes {
            shape.drawPath()
        }
    }
    
    private func defineCurrentShape(movement: Bool, point: CGPoint) {
        switch currentMode {
        case .Circle:
            let radius = abs(startPoint!.x - point.x) / 2
            let center = CGPoint(x: max(startPoint!.x, point.x) - radius, y: max(startPoint!.y, point.y) - radius)
            currentShape = Circle(radius, center, currentColor, isFilled: fill)
        case .Rectangle:
            currentShape = Rectangle(startPoint!, point, currentColor, isFilled: fill)
        case .Triangle:
            currentShape = Triangle(startPoint!, point, currentColor, isFilled: fill)
        case .Line:
            currentShape = Line(startPoint!, point, currentColor)
        case .Pen:
            if movement {
                (currentShape as! Pen).addPoint(point: point)
            } else {
                currentShape = Pen(point, currentColor)
            }
        }
    }
    
    func processStarted(point: CGPoint) {
        startPoint = point
        defineCurrentShape(movement: false, point: point)
        shapes.append(currentShape!)
    }
    
    func processMovement(point: CGPoint) {
        if !shapes.isEmpty {
            shapes.removeLast()
        }
        defineCurrentShape(movement: true, point: point)
        shapes.append(currentShape!)
    }
    
    func switchMode(tag: Int) {
        switch tag {
        case 0:
            currentMode = .Circle
        case 1:
            currentMode = .Rectangle
        case 2:
            currentMode = .Triangle
        case 3:
            currentMode = .Line
        case 4:
            currentMode = .Pen
        default:
            break
        }
    }
    
    func changeColor(tag: Int) {
        switch tag {
        case 0:
            currentColor = .black
        case 1:
            currentColor = .red
        case 2:
            currentColor = .green
        case 3:
            currentColor = .yellow
        default:
            break
        }
    }
    
    func switchFill(_ switchValue: Bool) {
        fill = switchValue
    }
    
    func removeLast() {
        if !shapes.isEmpty {
            let lastShape = shapes.last
            shapes.removeLast()
            if let pen = lastShape as? Pen {
                if !pen.isEmpty() {
                    pen.removeLast()
                    shapes.append(pen)
                }
            }
        }
    }
}

extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
}

protocol Shape {
    func drawPath()
}
