import Foundation



public func plot(p: DiscretePlot, _ options: String = "r") -> Figure {
    let f = Figure()
    return f.addPlot(p, options)
}

public func plot(xs: Vector, _ ys: Vector, _ options: String = "r") -> Figure {    
    return plot(VectorPlot(xs: xs, ys: ys), options)
}

