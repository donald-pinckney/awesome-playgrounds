import Cocoa

typealias Point = (x: Double, y: Double)

func pointToNSPoint(p: Point) -> NSPoint {
    return NSPoint(x: p.x, y: p.y)
}

public protocol DiscretePlot {
    var count: Int { get }
    subscript(i: Int) -> (x: Double, y: Double) { get }
}
//
//let PLOT_WIDTH = 400.0
//let PLOT_HEIGHT = 400.0

public class Figure: NSView {
    
    var cartPoints: [([Point], String)] = []
    
    var minX = DBL_MAX
    var maxX = DBL_MIN
    
    var minY = DBL_MAX
    var maxY = DBL_MIN
    
    // MARK: - Drawing Options
    public var displayAsBoxedPlot: Bool = false {
        didSet {
            needsDisplay = true
        }
    }
    
    public var displayGridlines: Bool = true {
        didSet {
            needsDisplay = true
        }
    }
    
    public var displayAxes: Bool = true {
        didSet {
            needsDisplay = true
        }
    }
    

    
    // MARK: - Main Plot Interface
    convenience init() {
        let rect = NSRect(x: 0, y: 0, width: 600, height: 600)
        
        self.init(frame: rect)
    }
    
    public func addPlot(plot: DiscretePlot, _ options: String = "r") -> Figure {
        var plotPoints: [Point] = []
        
        for i in 0..<plot.count {
            let p = plot[i]
            if p.y > maxY {
                maxY = p.y
            } else if p.y < minY {
                minY = p.y
            }
            
            if p.x > maxX {
                maxX = p.x
            } else if p.x < minX {
                minX = p.x
            }
            
            plotPoints.append(p)
        }
        
        let data = (plotPoints, options)
        cartPoints.append(data)
        
        needsDisplay = true
        
        return self
    }
    
    
    public func addPlot(xs: Vector, _ ys: Vector, _ options: String = "r") -> Figure {
        assert(xs.count == ys.count)
        
        return addPlot(VectorPlot(xs: xs, ys: ys), options)
    }
    
    public func addPlot(xs: Vector, _ f: Double -> Double, _ options: String = "r") -> Figure {
        return addPlot(VectorPlot(xs: xs, ys: Vector(values: xs.values.map(f))), options)
    }
    
    
    
    // MARK: - Coordinate conversions
    func convertCartesianToViewspace(cart: Point) -> Point {
        let xPercent = (cart.x - self.minX) / (self.maxX - self.minX);
        let yPercent = (cart.y - self.minY) / (self.maxY - self.minY);
        let b = graphBounds()
        return (x: Double(b.origin.x) + Double(b.size.width) * xPercent,
            y: Double(b.origin.y) + Double(b.size.height) * yPercent)
    }
    
    func convertViewspaceWidthToCartesianWidth(w: Double) -> Double {
        return (maxX - minX) / Double(graphBounds().size.width) * w;
    }
    
    func convertViewspaceWidthToCartesianHeight(h: Double) -> Double {
        return (maxY - minY) / Double(graphBounds().size.height) * h;
    }
    
    func graphBounds() -> NSRect {
        return bounds
    }
    
    
    
    let OPTIMAL_GRID_SIZE = 40.0
    
    // MARK: - Grid Width Calculations
    func optimalCartesianGridWidth() -> Double {
        let cartesianOptimalGridWidth = convertViewspaceWidthToCartesianWidth(OPTIMAL_GRID_SIZE)
        var choices: [[String: Double]] = []
        for width in 1..<Int(maxX - minX) {
            let numGrids = (maxX - minX) / Double(width)
            let difference = (maxX - minX) - numGrids * Double(width)
            
            let choice = ["cartesianWidth": Double(width),
                          "price": fabs(cartesianOptimalGridWidth - Double(width)) + difference]
            
            
            choices.append(choice)
        }
        
        
        return choices.sort() { $0["price"] < $1["price"] } [0]["cartesianWidth"]!
    }
    
    func optimalCartesianGridHeight() -> Double {
        let cartesianOptimalGridHeight = convertViewspaceWidthToCartesianHeight(OPTIMAL_GRID_SIZE)
        var choices: [[String: Double]] = []
        for height in 1..<Int(maxY - minY) {
            let numGrids = (maxY - minY) / Double(height)
            let difference = (maxY - minY) - numGrids * Double(height)
            
            let choice = ["cartesianHeight": Double(height),
                "price": fabs(cartesianOptimalGridHeight - Double(height)) + difference]
            
            
            choices.append(choice)
        }
        
        return choices.sort() { $0["price"] < $1["price"] } [0]["cartesianHeight"]!
    }
    
    
    // MARK: - Drawing Code
    override public func drawRect(rect: NSRect) {
        super.drawRect(rect)
        
//        print("render", appendNewline: true)

        
        // Calculate insets based on labels
        if(self.displayAsBoxedPlot) {
//            NSSize xlabelSize = [[self.dataSource XAxisLabelInGraphView:self] sizeWithAttributes:[self axesLabelsAttributes]];
//            self.bottomGraphInset = xlabelSize.height + AXIS_LABEL_TO_BORDER_SPACE;
//            
//            NSSize ylabelSize = [[self.dataSource YAxisLabelInGraphView:self] sizeWithAttributes:[self axesLabelsAttributes]];
//            self.leftGraphInset = ylabelSize.width + AXIS_LABEL_TO_BORDER_SPACE + Y_BORDER_EXTRA_INSET;
        }
        
        // Draw gridlines
//        if(self.displayGridlines) {
//            NSColor.blackColor().setStroke()
//            drawGridlines()
//        }
        
        // Draw axes
        if(self.displayAxes && !self.displayAsBoxedPlot) {
            // Draw X axis
            NSColor.blackColor().setStroke()
            drawXAxis()
            drawYAxis()
        }
        
        // Draw box
        if(self.displayAsBoxedPlot) {
            NSColor.blackColor().setStroke()
            
            let path = NSBezierPath(rect: graphBounds())
            path.lineWidth = 2.0;
            path.stroke()
        }
        
        
        // Draw plots
        for i in 0..<cartPoints.count {
            drawPoints(cartPoints[i])
//            print(cartPoints[i])
        }

        
//        // Draw axes labels
//        [self drawAxesLabels];
    }
    

    
    func drawXAxis() {
        let path = NSBezierPath()
        path.moveToPoint(pointToNSPoint(convertCartesianToViewspace((x: 0, maxY))))
        path.lineToPoint(pointToNSPoint(convertCartesianToViewspace((x: 0, minY))))
        
        path.stroke()
    }
    
    func drawYAxis() {
        let path = NSBezierPath()
        path.moveToPoint(pointToNSPoint(convertCartesianToViewspace((x: minX, 0))))
        path.lineToPoint(pointToNSPoint(convertCartesianToViewspace((x: maxX, 0))))
        path.stroke()
    }
    
    func drawPoints(pointsData: ([Point], String)) {
        let points = pointsData.0
        let options = pointsData.1
        assert(points.count > 0)
        
        if let color = getColorFromString(options[options.startIndex]) {
            color.setStroke()
        } else {
            NSColor.redColor().setStroke()
        }
        
        
        let path = NSBezierPath()
        path.moveToPoint(pointToNSPoint(convertCartesianToViewspace(points[0])))
        
        for i in 1..<points.count {
            path.lineToPoint(pointToNSPoint(convertCartesianToViewspace(points[i])))
        }
        
        path.lineWidth = 2
        
        path.stroke()
    }
    
    
}