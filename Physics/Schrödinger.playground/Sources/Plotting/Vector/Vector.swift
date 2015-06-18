import Foundation

public struct Vector {
    var values: [Double]
    
    public init(_ r: Range<Int>) {
        values = []
        for i in r {
            values.append(Double(i))
        }
    }
    
    public init(values: [Double]) {
        self.values = values
    }
    
    public subscript(i: Int) -> Double {
        get {
            return values[i]
        }
        set(v) {
            values[i] = v
        }
    }
    
    public var count: Int {
        return values.count
    }
}

