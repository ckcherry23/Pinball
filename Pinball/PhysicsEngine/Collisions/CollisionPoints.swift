//
//  CollisionPoints.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

class CollisionPoints {
    private(set) var AinB : CGVector
    private(set) var BinA : CGVector
    private(set) var normal : CGVector
    private(set) var depth : CGFloat
    private(set) var haveCollided : Bool
    
    init() {
        self.AinB = CGVector()
        self.BinA = CGVector()
        self.normal = CGVector()
        self.depth = 0.0
        self.haveCollided = false
    }
    
    init(AinB: CGVector, BinA: CGVector, normal: CGVector, depth: CGFloat, haveCollided: Bool) {
        self.AinB = AinB
        self.BinA = BinA
        self.normal = normal
        self.depth = depth
        self.haveCollided = haveCollided
    }
    
    func reverse() -> CollisionPoints {
        var temp : CGVector = AinB
        AinB = BinA
        BinA = temp
        normal = -normal
        return self
    }
}

struct Transform {
    private(set) var position : CGVector = CGVector()
    private(set) var scale : CGVector = CGVector()
    private(set) var rotation : CGFloat = 0.0
}

func findBallAndBallCollisionPoints(firstBall: BallCollider, firstTransform: Transform, secondBall: BallCollider, secondTransform: Transform) -> CollisionPoints {
    var A : CGVector = firstBall.center + firstTransform.position
    var B : CGVector = secondBall.center + secondTransform.position
    
    var AtoB : CGVector = B - A
    var BtoA : CGVector = A - B
    
    if AtoB.length() - secondBall.radius > firstBall.radius {
        return CollisionPoints()
    }
    
    A += AtoB.normal() * firstBall.radius
    B += BtoA.normal() * secondBall.radius
    
    return CollisionPoints(AinB: A, BinA: B, normal: BtoA.normal(), depth: AtoB.length(), haveCollided: true)
}

func findBallAndPlaneCollisionPoints(ball: BallCollider, ballTransform: Transform, plane: PlaneCollider, planeTransform: Transform) -> CollisionPoints {
    var A : CGVector = ball.center + ballTransform.position
    var N : CGVector = plane.plane.normal() * planeTransform.rotation + planeTransform.position
    var P : CGVector = N * plane.distance
    
    var d : CGFloat = (A - P) * N
    
    if d > ball.radius {
        return CollisionPoints()
    }
    
    var B = A - N * d
    A = A - N * ball.radius
    var AtoB : CGVector = B - A
    
    return CollisionPoints(AinB: A, BinA: B, normal: N.normal(), depth: AtoB.length(), haveCollided: true)
}
