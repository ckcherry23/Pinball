//
//  World.swift
//  Pinball
//
//  Created by Charisma Kausar on 8/12/22.
//

import Foundation

class World {
    private(set) var bodies: [Body] = []
    static let gravity: CGVector = CGVector(dx: 0, dy: -9.81)
    static let coefficientOfRestitution = 0.9
    
    public func addBody(body: Body) {
        bodies.append(body)
    }
    
    public func removeBody(body: Body) {
        bodies.removeAll{$0 === body}
    }
    
    public func updateWorld(dt: TimeInterval) {
        resolveCollisions(dt: dt)
        
        for body in bodies {
            body.updateBody(dt: dt)
        }
    }
    
    public func resolveCollisions(dt: TimeInterval) {
        for firstBody in bodies {
            for secondBody in bodies {
                guard firstBody !== secondBody else {
                    break // To avoid checking each pair twice
                }
                
                guard Body.checkBodiesAreCollidable(firstBody: firstBody, secondBody: secondBody) else {
                    continue // To ensure both bodies are collidable
                }
                
                let collisionPoints : CollisionPoints = CollisionDetector.detectCollision(firstBody: firstBody, secondBody: secondBody)
                
                if collisionPoints.haveCollided {
                    var collision = Collision(firstBody: firstBody, secondBody: secondBody, collisionPoints: collisionPoints)
                    collision.resolveCollision()
                }
            }
        }
    }
}
