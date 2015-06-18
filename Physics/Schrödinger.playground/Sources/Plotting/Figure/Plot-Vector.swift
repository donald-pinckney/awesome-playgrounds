import Foundation

extension Vector: DiscretePlot {
    public subscript(i: Int) -> (x: Double, y: Double) {
        get {
            return (x: Double(i), y: values[i])
        }
    }
}


struct VectorPlot: DiscretePlot {
    let xs: Vector
    let ys: Vector
    
    var count: Int {
        return xs.count
    }
    
    subscript(i: Int) -> (x: Double, y: Double) {
        get {
            return (x: xs[i], y: ys[i])
        }
    }
}