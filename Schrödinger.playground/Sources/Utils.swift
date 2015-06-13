import Foundation
import XCPlayground

public func plot<T>(xs: [T], _ label: String) {
    for x in xs {
        XCPCaptureValue(label, value: x)
    }
}

func sign(x: Double) -> Double {
    return x >= 0.0 ? 1 : -1
}