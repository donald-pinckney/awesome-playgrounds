import Foundation


public struct Potentials: CustomStringConvertible {
    let text: String
    let f: Double -> Double
    
    public var description: String {
        return text
    }
    
    
    public static var HarmonicOscillator: Double -> Double {
        let V: Double -> Double = { 0.5 * $0 * $0 }
        return V
    }
    public static var FiniteWell: Double -> Double {
        return { 2.5 * sign(fabs($0) - 2.0) + 2.5 }
    }
    
    
    public static func Other(f: Double -> Double) -> Potentials {
        return Potentials(text: "Other", f: f)
    }
}

