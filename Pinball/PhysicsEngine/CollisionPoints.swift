//
//  CollisionPoints.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

struct CollisionPoints {
    private(set) var AinB : CGVector
    private(set) var BinA : CGVector
    private(set) var normal : CGVector
    private(set) var depth : CGFloat
    private(set) var hasCollision : Bool
}

struct Transform {
    private(set) var position : CGVector
    private(set) var scale : CGVector
    private(set) var rotation : CGFloat
}

func findBallAndBallCollisionPoints(firstBall: BallCollider, firstTransform: Transform, secondBall: BallCollider, secondTransform: Transform) -> CollisionPoints {
    var A : CGVector = firstBall.center + firstTransform.position
    var B : CGVector = secondBall.center + secondTransform.position
    
    var AtoB : CGVector = B - A
    var BtoA : CGVector = A - B
    
    if AtoB.length() - secondBall.radius > firstBall.radius {
        return CollisionPoints(AinB: CGVector(), BinA: CGVector(), normal: CGVector(), depth: 0.0, hasCollision: false)
    }
    
    A += AtoB.normal() * firstBall.radius
    B += BtoA.normal() * secondBall.radius
    
    return CollisionPoints(AinB: A, BinA: B, normal: BtoA.normal(), depth: AtoB.length(), hasCollision: true)
}

func findBallAndPlaneCollisionPoints(ball: BallCollider, ballTransform: Transform, plane: PlaneCollider, planeTransform: Transform) -> CollisionPoints {
    var A : CGVector = ball.center + ballTransform.position
    var N : CGVector = plane.plane.normal() * planeTransform.rotation + planeTransform.position
    var P : CGVector = N * plane.distance
    
    var d : CGFloat = (A - P) * N
    
    if d > ball.radius {
        return CollisionPoints(AinB: CGVector(), BinA: CGVector(), normal: CGVector(), depth: 0.0, hasCollision: false)
    }
    
    var B = A - N * d
    A = A - N * ball.radius
    
    return CollisionPoints(AinB: A, BinA: B, normal: N.normal(), depth: (B - A).length(), hasCollision: true)
}
