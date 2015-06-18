//: [Previous](@previous)

/*:
# Schrödinger's Equation: Finite Well System
The potential function `V(x)` for the finite well is shown in the figure below. Importantly, the walls of the well are not infinitely high, which actually makes it impossible to completely solve the Schrödinger Equation analytically. Instead, numerical means like this are required.

Once again, we start by defining the potential for the system:
*/
import Foundation

let V = { x in
    return 2.5 * sign(abs(x) - 2.0) + 2.5
}

/*:
## Question 1
Find the four lowest bound-state energies to three significant figures by adjusting the energy and symmetry below.
*/

solveSchrödinger(potential: V, energy: 0.2, symmetry: Even, plotLabel: "Plot of ψ")







/*:
## Question 2
Do the functions the computer generates look like we would expect them to look at values of `x` where `E > V`? Where `E < V`? Explain.
*/







/*:
## Question 3
An analytical solution of the *infinite* well system gives the result that the bound-state energies are:

![eq6](eq6.pdf)

How closely do your results from Question 1 (*finite* well) match the equation above (*infinite* well)? Are some closer than others, and why? Keep in mind that we defined `ℏ` and `m` to be 1, and that `L`, the width of the well, is 4.
*/







//: [Next](@next)
