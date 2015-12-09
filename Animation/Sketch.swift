//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch {

    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : Canvas
    
    // Declare any properties you need for your sketch below this comment, but before init()
    
    var width = 25
    var height = 25
    var x = 0
    var s = 5
    var x2 = 0
    var s2 = 0
    

    // This runs once, equivalent to setup() in Processing
    init() {
        
        // Create canvas object – specify size
        canvas = Canvas(width: 500, height: 250)
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
        //this is so that the ball starts off of the wall
        x = width/2
        x2 = width/2
        s2 = s * 2
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Horizontal position of circle
        x = x + s
        x2 = x2 + s2
        
        
        // Bounce when hitting wall
        if (x + (width / 2) > canvas.width || x < width/2 || x == x2 ) {
            s *= -1
        }
        if (x2 + (width / 2) > canvas.width || x2 < width/2) {
            s2 *= -1
        }
        
        // Clear the background
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        canvas.drawRectangle(bottomRightX: 0, bottomRightY: 0, width: canvas.width, height: canvas.height)
        
        //Draw a white rectangle
        canvas.drawShapesWithBorders = false
        canvas.lineColor = Color(hue: 0, saturation: 0, brightness: 100, alpha: 100)
        canvas.drawRectangle(bottomRightX: 30, bottomRightY: 30, width: 30, height: 30, borderWidth: 5)
        
        // Draw a circle that moves across the screen
        canvas.drawShapesWithBorders = false
        canvas.fillColor = Color(hue: Float(canvas.frameCount), saturation: 80, brightness: 90, alpha: 100)
        canvas.drawEllipse(centreX: x, centreY: canvas.height / 3 * 2, width: width, height: height)
        
        canvas.drawEllipse(centreX: x2, centreY: canvas.height / 3, width: width, height: 25)

        
    }
    
}