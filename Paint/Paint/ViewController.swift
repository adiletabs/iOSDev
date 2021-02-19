//
//  ViewController.swift
//  Paint
//
//  Created by Adilet Absatov on 19.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var canvas: CustomView!
    private var mainModel = MainModel()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.mainModel = mainModel
    }
    
    @IBAction func shapePressed(_ sender: UIButton) {
        mainModel.switchMode(tag: sender.tag)
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        mainModel.changeColor(tag: sender.tag)
    }
    
    @IBAction func switchFill(_ sender: UISwitch) {
        mainModel.switchFill(sender.isOn)
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        clear()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(clear), userInfo: nil, repeats: true)
    }
    
    @IBAction func invalidate(_ sender: UIButton) {
        timer?.invalidate()
    }
    
    @objc func clear() {
        mainModel.removeLast()
        canvas.setNeedsDisplay()
    }
}
