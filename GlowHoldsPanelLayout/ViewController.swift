//
//  ViewController.swift
//  GlowHoldsPanelLayout
//
//  Created by Chris Parsons on 1/22/17.
//  Copyright © 2017 Rectec. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var wallPanel: NSView!
    @IBOutlet weak var coordinateTextPanel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func layoutButtonClicked(_ sender: NSButton) {
        var holdData = ""
        for subview in wallPanel.subviews{
            subview.removeFromSuperview()
        }
        
        let holdGeneration = HoldLocations()
        let holdCoordinates =  holdGeneration.getHoldCoordinates(wallheight: 1220, wallWidth: 1220, numberOfHolds: 12, minHoldSpacing: 203)
        let sortedHolds = holdCoordinates.sorted { $0[0] < $1[0] }
        for hold in sortedHolds {
            placeHoldOnWall(xCoord: hold[0], yCoord: hold[1])
            holdData.append("\(String(hold[0]))      \(String(hold[1]))\r\n")
        }
        
        coordinateTextPanel.stringValue = holdData
    }
    
    func placeHoldOnWall(xCoord :Int, yCoord :Int){
        
        let imgView = NSImageView(frame:NSRect(x: Int((Double(xCoord)/2.54)) - Int(#imageLiteral(resourceName: "Climbing Hold").size.width / 2) , y: Int((Double(yCoord)/2.54)) - Int(#imageLiteral(resourceName: "Climbing Hold").size.height / 2), width: Int(#imageLiteral(resourceName: "Climbing Hold").size.width), height: Int(#imageLiteral(resourceName: "Climbing Hold").size.height)))
        imgView.image = #imageLiteral(resourceName: "Climbing Hold")
        wallPanel.addSubview(imgView)
    }
}

