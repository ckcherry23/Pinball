//
//  World.swift
//  Pinball
//
//  Created by Charisma Kausar on 8/12/22.
//

import Foundation

class World {
    private(set) var bodies: [Body] = []
    private(set) var gravity: CGVector = CGVector(dx: 0, dy: -9.81)
    
    public func addBody(body: Body) {
        bodies.append(body)
    }
    
    public func removeBody(body: Body) {
        bodies.removeAll{$0 === body}
    }
    
    public func updateWorld(dt: TimeInterval) {
        for body in bodies {
            body.updateBody(dt: dt, gravity: gravity)
        }
    }
}
