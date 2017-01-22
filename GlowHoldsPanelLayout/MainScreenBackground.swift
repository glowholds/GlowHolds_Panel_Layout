//
//  MainScreenBackground.swift
//  Wall Designer
//
//  Created by Chris Parsons on 1/17/17.
//  Copyright © 2017 Rectec. All rights reserved.
//

import Cocoa
class MainScreenBackground: NSView {
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.hexColor(rgbValue: 0xE6C590, alpha: 0.8).setFill()
        NSRectFill(dirtyRect)
        super.draw(dirtyRect)
        
        // Drawing code here.
        GlowHoldsDesignerStyleKit.drawWallDesignerBackground()
    }
}

class WallPanel: NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
        GlowHoldsDesignerStyleKit.drawWallUnit()
    }
}

class ClimbingHold: NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
        GlowHoldsDesignerStyleKit.drawClimbingHold()
    }
}

class wallHexagon: NSView{
    override func draw(_ dirtyRect: NSRect)
    {
        
        let outerHexagon:NSBezierPath = NSBezierPath()
        outerHexagon.move(to: NSPoint(x:360,y:32))
        outerHexagon.line(to: NSPoint(x:120,y:32))
        outerHexagon.line(to: NSPoint(x:0,y:240))
        outerHexagon.line(to: NSPoint(x:120,y:448))
        outerHexagon.line(to: NSPoint(x:360,y:448))
        outerHexagon.line(to: NSPoint(x:480,y:240))
        outerHexagon.line(to: NSPoint(x:360,y:32))
        let fillColor = NSColor.hexColor(rgbValue: 0x8FE355, alpha: 1.0)
        fillColor.set()
        outerHexagon.fill()
        let borderColor = NSColor.hexColor(rgbValue: 0xFFFFFF, alpha: 1.0)
        borderColor.set()
        outerHexagon.lineWidth = 1.0
        outerHexagon.stroke()
        
        let innerHexagon:NSBezierPath = NSBezierPath()
        innerHexagon.move(to: NSPoint(x:340,y:67))
        innerHexagon.line(to: NSPoint(x:140,y:67))
        innerHexagon.line(to: NSPoint(x:40,y:240))
        innerHexagon.line(to: NSPoint(x:140,y:413))
        innerHexagon.line(to: NSPoint(x:340,y:413))
        innerHexagon.line(to: NSPoint(x:440,y:240))
        innerHexagon.line(to: NSPoint(x:340,y:67))
        let IHfillColor = NSColor.hexColor(rgbValue: 0x37D2F6, alpha: 1.0)
        IHfillColor.set()
        innerHexagon.fill()
        

    }
}


public extension NSColor {
    
    /**
     Returns an NSColor instance from the given hex value
     
     - parameter rgbValue: The hex value to be used for the color
     - parameter alpha:    The alpha value of the color
     
     - returns: A NSColor instance from the given hex value
     */
    public class func hexColor(rgbValue: Int, alpha: CGFloat = 1.0) -> NSColor {
        
        return NSColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue:((CGFloat)(rgbValue & 0xFF))/255.0, alpha:alpha)
        
    }
    
}
