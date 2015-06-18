//: [Previous](@previous)

/*:
# Schrödinger's Equation: Spike Well System
The potential function `V(x)` for the spike well is shown in the figure below. The spike well does properly hold a quanton bound, but it defies analytical solutions.

To solve it numerically, we start by defining the potential function for the system:
*/
import Foundation

let V = { x in
    8.0 - 8.0/(abs(x) + 1)
}

/*:
## Question 1
Find the three lowest bound-state energies to three significant figures by adjusting the energy and symmetry below.
*/

solveSchrödinger(potential: V, energy: 2.0, symmetry: Even)







//: [Next](@next)
