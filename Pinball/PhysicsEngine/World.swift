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
        resolveCollisions(dt: dt)
        
        for body in bodies {
            body.updateBody(dt: dt, gravity: gravity)
        }
    }
    
    public func resolveCollisions(dt: TimeInterval) {
        var collisions: [Collision] = []
        for firstBody in bodies {
            for secondBody in bodies {
                guard firstBody !== secondBody else {
                    break // To avoid checking each pair twice
                }
                
                guard let _ = firstBody.collider, let _ = secondBody.collider else {
                    continue // To ensure both bodies are colliders
                }
                
                var collisionPoints : CollisionPoints = firstBody.collider!.checkCollision(transform: firstBody.transform!, collider: secondBody.collider!, colliderTransform: secondBody.transform!)
                
                if collisionPoints.hasCollision {
                    collisions.append(Collision(firstBody: firstBody, secondBody: secondBody, collisionPoints: collisionPoints))
                }
            }
        }
    }
}
