//
//  CGVector.swift
//  Pinball
//
//  Created by Charisma Kausar on 10/12/22.
//

import Foundation

// Operator Overriding
extension CGVector {
    static func *(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func /(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    static func +=(first: CGVector, second: CGVector) -> CGVector {
        return CGVector(dx: first.dx + second.dx, dy: first.dy + second.dy)
    }
}
