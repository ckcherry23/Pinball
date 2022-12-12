//
//  Collision.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

class Collision {
    private(set) var firstBody : Body
    private(set) var secondBody : Body
    private(set) var collisionPoints : CollisionPoints
    
    init(firstBody: Body, secondBody: Body, collisionPoints: CollisionPoints) {
        self.firstBody = firstBody
        self.secondBody = secondBody
        self.collisionPoints = collisionPoints
    }

    public func resolveCollision() {
        guard collisionPoints.haveCollided else {
            return
        }
        
        var impulseVector : CGVector = findImpulseVector()
        
        firstBody.addVelocity(additionalVelocity: -impulseVector * firstBody.getInverseMass())
        secondBody.addVelocity(additionalVelocity: impulseVector * secondBody.getInverseMass())
        
        updatePositionsAfterCollision()
    }
    
    private func findImpulseVector() -> CGVector {
        guard collisionPoints.haveCollided else {
            return CGVector()
        }
        
        var relativeVelocity : CGVector = secondBody.velocity - firstBody.velocity
        var speed : CGFloat = relativeVelocity * collisionPoints.normal
        var e : CGFloat = pow(World.coefficientOfRestitution, 2)
        var j : CGFloat = -(1.0 + e) * speed / (firstBody.getInverseMass() + secondBody.getInverseMass())
        
        return collisionPoints.normal * j
    }

    private func updatePositionsAfterCollision() {
        if firstBody.isMovable && secondBody.isMovable {
            firstBody.addPosition(additionalVector: collisionPoints.normal * collisionPoints.depth / 2)
            secondBody.addPosition(additionalVector: -collisionPoints.normal * collisionPoints.depth / 2)
        } else if firstBody.isMovable {
            firstBody.addPosition(additionalVector: collisionPoints.normal * collisionPoints.depth)
        } else if secondBody.isMovable {
            secondBody.addPosition(additionalVector: -collisionPoints.normal * collisionPoints.depth)
        }
    }
}
