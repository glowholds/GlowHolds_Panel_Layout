//
//  HoldLocations.swift
//  Wall Designer
//
//  Created by Chris Parsons on 1/18/17.
//  Copyright © 2017 Rectec. All rights reserved.
//

import Foundation

class HoldLocations {
    func getHoldCoordinates(wallheight: Int, wallWidth: Int, numberOfHolds: Int, minHoldSpacing: Int) -> [[Int]] {
        var placedHolds: [[Int]] = []
        var iteration = 0
        while placedHolds.count < numberOfHolds && iteration < 1000 {
            iteration += 1
            var addHoldToArray = true
            let candidateHoldX = Int(arc4random_uniform(UInt32(wallWidth)))
            let candidateHoldY = Int(arc4random_uniform(UInt32(wallheight)))
            for testHold in placedHolds {
                let testHoldX = testHold[0]
                let testHoldY = testHold[1]
                let holdDistance = Int(sqrt(pow(Double(candidateHoldX - testHoldX),2) + pow(Double(candidateHoldY - testHoldY),2)))
                if holdDistance < minHoldSpacing {
                    addHoldToArray = false
                    break
                }
            }
            
            if !pointInHexagon(testPoint: CGPoint(x:candidateHoldX,y:candidateHoldY)){
                addHoldToArray = false
            }
            
            if addHoldToArray {
                
                placedHolds.append([candidateHoldX, candidateHoldY])
            }
        }
        return placedHolds
    }

    
    func pointInHexagon(testPoint: CGPoint) -> Bool {
        let polygon:[CGPoint] = [CGPoint(x:865,y:168), CGPoint(x:355,y:168), CGPoint(x:100,y:610), CGPoint(x:355,y:1052), CGPoint(x:865,y:1052), CGPoint(x:1120,y:610)]
        var pJ=polygon.last!
        var contains = false
        for pI in polygon {
            if ( ((pI.y >= testPoint.y) != (pJ.y >= testPoint.y)) &&
                (testPoint.x <= (pJ.x - pI.x) * (testPoint.y - pI.y) / (pJ.y - pI.y) + pI.x) ){
                contains = !contains
            }
            pJ=pI
        }
        return contains
    }
}
