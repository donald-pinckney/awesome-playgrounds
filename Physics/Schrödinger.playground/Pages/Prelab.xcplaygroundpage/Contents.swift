/*:
# Schrödinger's Equation: Numerical Solutions Prelab

## Symmetry

Symmetry is a very important thing to understand and a powerful tool. When the potential energy “holding” a quanton is symmetric about x = 0, we expect, “by symmetry”, that the quantum-mechanical
probabilities `ψ^2(x)` should also be symmetric functions of x. But related to this are mathematical ideas you’ll need to grasp well for today’s lab.
*/
/*:
### Question 1
What defines an “even” function of x, and what defines an “odd” function of x?
*/







/*:
### Question 2
Must the function itself, or its slope, or both, be zero at `x=0` if the function is even? odd? Briefly explain.
*/







/*:
### Question 3
If `ψ(x)` is even, must it be true that `ψ^2(x)` must also be even? If `ψ(x)` is odd? Briefly expalin.
*/







/*:
### Quetsion 4
Write down an explicit `f(x)` that is neither even nor odd.
*/







/*:
## Application to Schrödinger's Equation
As mentioned above, if the potential function `V(x)` is symmetric about `x = 0`, then we expect that the quantum-mechanical probabilities `ψ^2(x)` should be symmetric about `x = 0` as well.  As shown in Question 3, if a function `f^2(x)` is symmetric about `x = 0`, then `f(x)` can either be even or odd, so that tells us there are 2 cases for the wave function `ψ(x)`:
* `ψ(x)` can be even.
* `ψ(x)` can be odd.

By applying Question 2, those 2 cases become:
* `ψ'(0) = 0`.
* `ψ(0) = 0`.

Numerically solving a 2nd order differntial equation, such as Schrödinger's Equation, requires 2 initial conditions: `ψ(0)` and `ψ(0 + dx)`.  The 2 cases above tell us that we should check 2 kinds of inital conditions, one corresponding to even wave functions, and one corresponding to odd wave functions.  By applying the definition of the derivative, and choosing arbitrary constants to be 1, the initial conditions are:
* Even: `ψ(0) = 1`, `ψ(0 + dx) = 1`.
* Odd: `ψ(0) = 0`, `ψ(0 + dx) = 1`.


*/
//: [Next](@next)

