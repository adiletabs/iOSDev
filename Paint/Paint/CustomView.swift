//
//  CustomView.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import UIKit

class CustomView: UIView {
    var mainModel = MainModel()

    override func draw(_ rect: CGRect) {
        mainModel.drawShapes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            mainModel.processStarted(point: touch.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            mainModel.processMovement(point: touch.location(in: self))
        }
        setNeedsDisplay()
    }
}
