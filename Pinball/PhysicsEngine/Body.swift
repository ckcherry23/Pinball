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
    private(set) var isMovable : Bool = true
    
    init(position: CGVector, mass: CGFloat) {
        self.position = position
        self.mass = mass
    }
    
    init(position: CGVector, mass: CGFloat, isMovable : Bool) {
        self.position = position
        self.mass = mass
        self.isMovable = isMovable
    }
    
    init(position: CGVector, velocity: CGVector, force: CGVector, mass: CGFloat, collider: Collider? = nil, transform: Transform? = nil, isMovable: Bool) {
        self.position = position
        self.velocity = velocity
        self.force = force
        self.mass = mass
        self.collider = collider
        self.transform = transform
        self.isMovable = isMovable
    }
    
    public func getInverseMass() -> CGFloat {
        return 1 / mass
    }
    
    public func addVelocity(additionalVelocity: CGVector) {
        self.velocity += additionalVelocity
    }
    
    public func addPosition(additionalVector: CGVector) {
        self.position += additionalVector
    }
    
    public func updateBody(dt: TimeInterval) {
        force += World.gravity * mass
        velocity += force / mass * dt
        position += velocity * dt
        force = CGVector() // reset net force
    }
    
    static func checkBodiesAreCollidable(firstBody: Body, secondBody: Body) -> Bool {
        return firstBody.collider != nil && secondBody.collider != nil
    }
    
}
