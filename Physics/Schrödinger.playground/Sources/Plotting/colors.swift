import Foundation
import Cocoa

func getColorFromString(s: Character) -> NSColor? {
    switch s {
        case "y":
            return NSColor.yellowColor()
        case "m":
            return NSColor.magentaColor()
        case "c":
            return NSColor.cyanColor()
        case "r":
            return NSColor.redColor()
        case "g":
            return NSColor.greenColor()
        case "b":
            return NSColor.blueColor()
        case "w":
            return NSColor.whiteColor()
        case "k":
            return NSColor.blackColor()
        default:
            return nil
    }
}