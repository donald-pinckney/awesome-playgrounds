import Foundation

public enum Symmetry {
    case Even, Odd
}

public let Even = Symmetry.Even
public let Odd = Symmetry.Odd


let dx = 0.001
public func solveSchrödinger(potential V: Double -> Double, energy E: Double, symmetry: Symmetry) -> Figure {
    let a = -4.0
    let b = 4.0
    let len = Int((b - a) / dx) + 1
    let psi0Index = len / 2
    let psi1Index = psi0Index + 1
    let psiNeg1Index = psi0Index - 1


    let psiNeg1: Double
    let psi0: Double
    let psi1: Double
    if symmetry == .Odd {
        psiNeg1 = -1.0
        psi0 = 0.0
        psi1 = 1.0
    } else {
        psiNeg1 = 1.0
        psi0 = 1.0
        psi1 = 1.0
    }


    var psi = [Double](count: len, repeatedValue: 0.0)
    psi[psiNeg1Index] = psiNeg1
    psi[psi0Index] = psi0
    psi[psi1Index] = psi1
    
    var xs = [Double](count: len, repeatedValue: 0.0)
    xs[psiNeg1Index] = -dx
    xs[psi0Index] = 0.0
    xs[psi1Index] = dx
    
    var Vs = [Double](count: len, repeatedValue: 0.0)
    Vs[psiNeg1Index] = V(-dx)
    Vs[psi0Index] = V(0.0)
    Vs[psi1Index] = V(dx)
    
    
    for i in psi1Index..<psi.count - 1 {
        let x = Double(i - psi0Index) * dx
        let v = V(x)
        psi[i+1] = 2*psi[i] - psi[i-1] - 2*dx*dx*(E - v)*psi[i]
        xs[i+1] = x
        Vs[i+1] = v
    }

    for i in (1...psiNeg1Index).reverse() {
        let x = Double(i - psi0Index) * dx
        let v = V(x)
        psi[i-1] = 2*psi[i] - psi[i+1] - 2*dx*dx*(E - v)*psi[i]
        xs[i-1] = x
        Vs[i-1] = v
    }
    
    
    let X = Vector(values: xs)
    let Y = Vector(values: psi)
    
    let yMin = min(Y)
    let yMax = max(Y)
    let yAbsMax = max(abs(yMin), abs(yMax))
    
    let tempVs = Vector(values: Vs)
    let vMin = min(tempVs)
    let vMax = max(tempVs)
    let vAbsMax = max(abs(vMin), abs(vMax))
    
    let scaleFactor = (yAbsMax / vAbsMax)
    
    let f = plot(X, Y, "b")
    f.addPlot(X, scale(tempVs, scaleFactor), "r")
    f.addPlot(X, { x in return scaleFactor * E }, "g")
    f.addPlot(X, { x in return 0 }, "k")
    f.displayAxes = false
    
    return f
}