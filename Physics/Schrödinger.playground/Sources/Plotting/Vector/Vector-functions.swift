import Foundation


// Math functions

func applyFunc(var v: Vector, _ f: Double -> Double) -> Vector {
    for i in 0..<v.count {
        v[i] = f(v[i])
    }
    
    return v
}


public func sin(v: Vector) -> Vector {
    return applyFunc(v, sin)
}

public func cos(v: Vector) -> Vector {
    return applyFunc(v, cos)
}

public func tan(v: Vector) -> Vector {
    return applyFunc(v, tan)
}

public func ln(v: Vector) -> Vector {
    return applyFunc(v, log)
}

public func exp(v: Vector) -> Vector {
    return applyFunc(v, exp)
}

public func scale(v: Vector, _ a: Double) -> Vector {
    return applyFunc(v) { a * $0 }
}

public func dot(a: Vector, _ b: Vector) -> Double {
    assert(a.count == b.count)
    var ret = 0.0
    for i in 0..<a.count {
        ret += a[i] * b[i]
    }
    return ret
}

public func add(var a: Vector, _ b: Vector) -> Vector {
    assert(a.count == b.count)
    for i in 0..<a.count {
        a[i] += b[i]
    }
    return a
}

public func add(var a: Vector, _ b: Double) -> Vector {
    for i in 0..<a.count {
        a[i] += b
    }
    return a
}

public func subtract(var a: Vector, _ b: Vector) -> Vector {
    assert(a.count == b.count)
    for i in 0..<a.count {
        a[i] -= b[i]
    }
    return a
}

public func multiply(var a: Vector, _ b: Vector) -> Vector {
    assert(a.count == b.count)
    for i in 0..<a.count {
        a[i] *= b[i]
    }
    return a
}

public func max(a: Vector) -> Double {
    var x = a.values[0]
    
    for d in a.values {
        if d > x {
            x = d
        }
    }
    
    return x
}

public func min(a: Vector) -> Double {
    var x = a.values[0]
    
    for d in a.values {
        if d < x {
            x = d
        }
    }
    
    return x
}

