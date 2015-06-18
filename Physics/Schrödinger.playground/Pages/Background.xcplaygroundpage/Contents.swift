//: [Previous](@previous)

/*: 
# Schrödinger's Equation: Numerical Solutions Background

Computers can find solutions to differential equations, which is particularly helpful when it is impossible to solve them analytically. Bound systems are some of the most important, and today we investigate 3 such systems:
* A quanton bound by a simple harmonic oscillator, which is solvable analytically.
* A quanton bound by a finite box.
* A quanton bound by a symmetric gravity well.

## Solving the Schödinger Equation
The time-independent Schödinger Equation is:

![time-independent Schödinger Equation](eq1.pdf)


In a nutshell, if we know the potential energy `V(x)` experienced by a quanton and its total energy `E`, we put them into this equation, and the solutions are possible wave functions `ψ(x)`, which tell us, among other things, where the probability of finding the particle is large. 

Note that the equation says that `ψ` and its second derivative will be of *opposite* sign whenever `E > V` and of the *same* sign whenever `E < V`. Today’s wave functions should bear this out. 

Another thing, at least as important, that we learn in the case of *bound* systems is that the *mathematical* solutions `ψ(x)` we find are *physically* acceptable for only certain values of the total energy E. In today’s lab we’ll certainly see what physically acceptable means.

To numerically solve the Schödinger Equation we use the definition of the derivative to determine discrete numerical steps to approximate the solution:

![Derivation of numerical solution](eq2.pdf)

Now because we are solving this numerically, `dx` won't actually become infinitesimally small, and we will just set `dx` to be some small constant. So, dropping the limit notation and substituting into the Schödinger Equation, we get:

![eq4](eq3.pdf)

Then solving for `ψ(x + dx)` and setting `ℏ` and `m` to be 1, the final result is:

![eq5](eq4.pdf)

Now to translate this to pseudo-code, we use the following steps:
*/
//: 1. Define the total energy and the potential function of the bound system. For now we will just use a harmonic oscillator.
import Foundation

let E = 0.45
let V = Potentials.HarmonicOscillator

//: 2. Define `dx`. **Try changing** dx to see how it affects the precision of the solution.
let dx = 0.01

//: 3. Define an array to hold the values of `ψ`, and setup initial conditions for an odd solution. See [Prelab](Prelab) for why these initial conditions create an odd solution.
var ψ = Array<Double>(count: Int(ceil(4 / dx)), repeatedValue: 0)
ψ[0] = 0
ψ[1] = 1

//: 4. Loop over the `ψ` array, and calculate each subsequent value using the formula derived above.
for i in 1..<ψ.count - 1 {
    let x = Double(i) * dx
    ψ[i+1] = 2.0*ψ[i] - ψ[i-1] - 2.0 * dx * dx * (E - V(x)) * ψ[i]
}

//: 5. Plot the array (If the plot isn't visible, click the Show Result button directly to the right)
plot(ψ, "Ψ")

/*:
Now this isn't all of the code necessary to adequately solve the Schödinger Equation, because it only solves for odd solutions, and even excludes the wave function left of `x = 0`. However, it is most of the algorithm, and you should understand how it works, especially step 4, before moving on.
*/

//: [Next](@next)

