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
    
    func checkCollision(transform: Transform, collider: Collider, colliderTransform: Transform) -> CollisionPoints {
        return collider.checkCollision(transform: colliderTransform, plane: self, planeTransform: transform)
    }
    
    func checkCollision(transform: Transform, ball: BallCollider, ballTransform: Transform) -> CollisionPoints {
        return ball.checkCollision(transform: ballTransform, plane: self, planeTransform: transform)
    }
    
    func checkCollision(transform: Transform, plane: PlaneCollider, planeTransform: Transform) -> CollisionPoints {
        return CollisionPoints(AinB: CGVector(), BinA: CGVector(), normal: CGVector(), depth: 0.0, hasCollision: false)
    }
    
}
