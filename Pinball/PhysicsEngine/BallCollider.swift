//
//  BallCollider.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

class BallCollider: Collider {
    
    private(set) var center : CGVector = CGVector()
    private(set) var radius : CGFloat = 0.0
    
    func checkCollision(transform: Transform, collider: Collider, colliderTransform: Transform) -> CollisionPoints {
        return collider.checkCollision(transform: colliderTransform, collider: self, colliderTransform: transform)
    }
    
    func checkCollision(transform: Transform, ball: BallCollider, ballTransform: Transform) -> CollisionPoints {
        return findBallAndBallCollisionPoints(firstBall: self, firstTransform: transform, secondBall: ball, secondTransform: ballTransform)
    }
    
    func checkCollision(transform: Transform, plane: PlaneCollider, planeTransform: Transform) -> CollisionPoints {
        return findBallAndPlaneCollisionPoints(ball: self, ballTransform: transform, plane: plane, planeTransform: planeTransform)
    }
    
}
