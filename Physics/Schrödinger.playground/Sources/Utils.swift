import Foundation
import XCPlayground

public func plot(xs: [Double], _ label: String) -> Figure {
//    for x in xs {
//        XCPCaptureValue(label, value: x)
//    }
    
//    let X = Vector()
    return plot(Vector(0..<xs.count), Vector(values: xs))
}

public func sign(x: Double) -> Double {
    return x >= 0.0 ? 1 : -1
}

public let PI = M_PI