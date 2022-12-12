//
//  CollisionDetector.swift
//  Pinball
//
//  Created by Charisma Kausar on 12/12/22.
//

import Foundation

class CollisionDetector {
    static func detectCollision(firstBody: Body, secondBody: Body) -> CollisionPoints {
        switch (firstBody.collider, secondBody.collider) {
        case let (firstBall, secondBall) as (BallCollider, BallCollider):
            return firstBall.detectCollision(transform: firstBody.transform!, ball: secondBall, ballTransform: secondBody.transform!)
        case let (ball, plane) as (BallCollider, PlaneCollider):
            return ball.detectCollision(transform: firstBody.transform!, plane: plane, planeTransform: secondBody.transform!)
        case let (plane, ball) as (PlaneCollider, BallCollider):
            return plane.detectCollision(transform: firstBody.transform!, ball: ball, ballTransform: secondBody.transform!)
        default:
            assertionFailure("Unexpected body in world")
            return CollisionPoints()
        }
    }
}
