import Foundation

public func *(a: Double, v: Vector) -> Vector {
    return scale(v, a)
}