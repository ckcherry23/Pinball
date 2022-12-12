//
//  Collider.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

protocol Collider {
    func detectCollision(transform: Transform, collider: Collider, colliderTransform : Transform) -> CollisionPoints
    func detectCollision(transform: Transform, ball: BallCollider, ballTransform : Transform) -> CollisionPoints
    func detectCollision(transform: Transform, plane: PlaneCollider, planeTransform : Transform) -> CollisionPoints
}
