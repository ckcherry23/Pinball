//
//  Collider.swift
//  Pinball
//
//  Created by Charisma Kausar on 11/12/22.
//

import Foundation

protocol Collider {
    func checkCollision(transform: Transform, collider: Collider, colliderTransform : Transform) -> CollisionPoints
    func checkCollision(transform: Transform, ball: BallCollider, ballTransform : Transform) -> CollisionPoints
    func checkCollision(transform: Transform, plane: PlaneCollider, planeTransform : Transform) -> CollisionPoints
}
