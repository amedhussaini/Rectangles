//
//  TouchBox.swift
//  Rectangles
//
//  Created by Amed Hussaini on 9/12/18.
//  Copyright © 2018 Amed Hussaini. All rights reserved.
//

import UIKit

class TouchBox: UIView {
    
    var isAnimating = false
    
    public func isTouching(with coords: (x: Double, y: Double), against touches: (x: Double, y: Double)) -> Bool {
        
        let width = Double(self.frame.width)
        let height = Double(self.frame.height)
        
        let topLeftX = coords.x
        let topLeftY = coords.y
        
        let bottomRightX = coords.x + width
        let bottomRightY = coords.y + height
        
 
        if (touches.x > topLeftX && touches.y > topLeftY && touches.x < bottomRightX && touches.y < bottomRightY) {
            return true
        } else {
            return false
        }
 
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
