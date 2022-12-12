//
//  PlaneCollider.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

class PlaneCollider: Collider {

    private(set) var plane : CGVector = CGVector()
    private(set) var distance : CGFloat = 0.0
    
    func detectCollision(transform: Transform, collider: Collider, colliderTransform: Transform) -> CollisionPoints {
        return collider.detectCollision(transform: colliderTransform, plane: self, planeTransform: transform)
    }
    
    func detectCollision(transform: Transform, ball: BallCollider, ballTransform: Transform) -> CollisionPoints {
        return ball.detectCollision(transform: ballTransform, plane: self, planeTransform: transform)
    }
    
    func detectCollision(transform: Transform, plane: PlaneCollider, planeTransform: Transform) -> CollisionPoints {
        return CollisionPoints()
    }
    
}
