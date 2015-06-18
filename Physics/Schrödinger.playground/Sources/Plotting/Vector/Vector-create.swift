import Foundation


public func zeros(n: Int) -> Vector {
    assert(n >= 0)
    
    return Vector(values: Array<Double>(count: n, repeatedValue: 0))
}

public func linspace(start x0: Double, end x1: Double, n: Int = 100) -> Vector {
    let gap = (x1 - x0) / Double(n-1)
    var v = zeros(n)
    
    for i in 0..<n {
        let val = x0 + Double(i)*gap
        v[i] = val
    }
    
    return v
}