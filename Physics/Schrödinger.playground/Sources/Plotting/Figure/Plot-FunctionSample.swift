import Foundation

public func plot(xs: Vector, _ f: Double -> Double, _ options: String = "r") -> Figure {
    return plot(VectorPlot(xs: xs, ys: Vector(values: xs.values.map(f))), options)
}