//
//  Body.swift
//  Pinball
//
//  Created by Charisma Kausar on 8/12/22.
//

import Foundation

class Body {
    private(set) var position : CGVector = CGVector()
    private(set) var velocity : CGVector = CGVector()
    private(set) var force : CGVector = CGVector()
    private(set) var mass : CGFloat = 0
    private(set) var collider : Collider?
    private(set) var transform : Transform?
    
    init(position: CGVector, mass: CGFloat) {
        self.position = position
        self.mass = mass
    }
    
    public func updateBody(dt: TimeInterval, gravity: CGVector) {
        force += gravity * mass
        velocity += force / mass * dt
        position += velocity * dt
        force = CGVector() // reset net force
    }
}
