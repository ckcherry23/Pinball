//
//  CGVector.swift
//  Pinball
//
//  Created by Charisma Kausar on 10/12/22.
//

import Foundation

// Operator Overriding
extension CGVector {
    static prefix func -(vector: CGVector) -> CGVector {
        return CGVector(dx: -vector.dx, dy: -vector.dy)
    }
    
    static func *(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func /(vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    static func +(first: CGVector, second: CGVector) -> CGVector {
        return CGVector(dx: first.dx + second.dx, dy: first.dy + second.dy)
    }
    
    static func -(first: CGVector, second: CGVector) -> CGVector {
        return CGVector(dx: first.dx - second.dx, dy: first.dy - second.dy)
    }
    
    static func *(first: CGVector, second: CGVector) -> CGFloat {
        return first.dx * second.dx + first.dy * second.dy // dot product
    }

    static func +=(first: inout CGVector, second: CGVector) {
        first = CGVector(dx: first.dx + second.dx, dy: first.dy + second.dy)
    }
}

// Vector Properties
extension CGVector {
    func length() -> CGFloat {
        return sqrt(dx * dx + dy * dy)
    }
    
    func normal() -> CGVector {
        return self / self.length()
    }
}
