import Foundation

public enum Symmetry {
    case Even, Odd
}

public let Even = Symmetry.Even
public let Odd = Symmetry.Odd


let dx = 0.001
public func solveSchrödinger(potential V: Double -> Double, energy E: Double, symmetry: Symmetry, plotLabel: String = "ψ") -> [Double] {
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

    for i in psi1Index..<psi.count - 1 {
        let x = Double(i - psi0Index) * dx
        psi[i+1] = 2*psi[i] - psi[i-1] - 2*dx*dx*(E - V(x))*psi[i]
    }

    for i in (1...psiNeg1Index).reverse() {
        let x = Double(i - psi0Index) * dx
        psi[i-1] = 2*psi[i] - psi[i+1] - 2*dx*dx*(E - V(x))*psi[i]
    }
    
    plot(psi, plotLabel)
    
    return psi
}