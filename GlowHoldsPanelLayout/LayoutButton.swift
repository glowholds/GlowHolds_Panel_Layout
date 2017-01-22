//
//  LayoutButton.swift
//  Wall Designer
//
//  Created by Chris Parsons on 1/18/17.
//  Copyright © 2017 Rectec. All rights reserved.
//

import Cocoa

class LayoutButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
GlowHoldsDesignerStyleKit.drawLayoutButton()
        // Drawing code here.
    }
    
}
