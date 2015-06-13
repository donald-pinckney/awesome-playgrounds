//: [Previous](@previous)

/*:
# Schrödinger's Equation: Harmonic Oscillator System
Something very important here and in other bound cases is that the all-important potential energy is symmetric about `x = 0`. Accordingly, the probabilities `ψ^2(x)` should be symmetric functions of x. However, this means that some `ψ` will be zero at the origin (odd) while others will have zero slope there (even). We’ll start out looking for a function that is odd.

To do that, we start by defining the potential, `0.5*k*x^2`, that we will use for this section, with `k` set to 1:
*/
import Foundation

let V = { x in
    0.5 * 1.0 * x * x
}

/*: 
Next, we simply run the function solveSchrödinger, and specify the V we setup, a total energy, and a symmetry, either `Odd` or `Even`.
Note that solveSchrödinger mostly contains the code discussed on the previous page, and a bit extra.
*/

solveSchrödinger(potential: V, energy: 1.49, symmetry: Odd, plotLabel: "Learning to use solveSchrödinger")

/*:
## Question 1
Now, we have just tested an odd function for `E = 1.49`, and see a plot of the *mathematical* solution.  What's *physically* unacceptable about this solution? Is it possible for it to return to the horizontal axis somewhere beyond the edges of the plot? Explain why or why not, based on the sign of `E-V(X)` in the Schrödinger Equation.
*/







/*:
## Question 2
Find the four lowest bound-state energies to three significant figures by adjusting the energy and symmetry below. Also, note if the shape of `ψ(x)` is correct: do `ψ(x)` and `ψ''(x)` have opposite signs where `E > V`, and same signs when `E < V`?
*/

solveSchrödinger(potential: V, energy: 1.49, symmetry: Odd, plotLabel: "Plot of ψ")







/*: 
## Question 3
An analytical solution of the harmonic oscillator gives the result that the bound-state energies are:

![eq5](eq5.pdf)

Do your results from Question 2 match the equation above? Remember that we defined `ℏ`, `m` and `k` to be 1.
*/







//: [Next](@next)
