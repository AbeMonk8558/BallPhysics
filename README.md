# BallPhysics
A highly-customizable 2D ball physics simulation created with Raylib (currently nowhere near completion). Uses continuous collision detection for hyper-accurate collisions.

## Overview
In the future, the math behind the continuous collision detection will be explained here. The simulation does not currently account for acceleration, though will in the future.

### Circle-circle
1. Let `a` and `b` be the initial positions of 2 circles.
2. Let `u` and `v` be the velocities of the 2 circles.
3. Let `t` measure elapsed time since the initial positions.
4. To find the position of a circle along a dimension (x or y), use the kinematic motion equation <code>p<sub>i</sub>(t) = p0<sub>i</sub> + v<sub>i</sub> * t</code>, where `i` is a dimension, `v` is a velocity, and `p0` is an initial position.
5. To find the distance between any 2 points, use Euler's distance formula subsituted with the kinematic motion equation: <code>sqrt((a<sub>x</sub>(t) - b<sub>x</sub>(t))<sup>2</sup> + (a<sub>y</sub>(t) - b<sub>y</sub>(t))<sup>2</sup>)</code>. Let this expression be called `d(t)`.
6. We know the 2 circles will collide when the distance between them is equal to the sum of their radii (`r1` and `r2`). Hence, we get <code>d(t) = r1 + r2</code>.
7. Keep in mind all the variables in the equation are constants except for `t`. The next logical step is to solve for `t`, hence producing the exact time at which the 2 circles collide. I won't go over this part in 
detail because its tedious as a MF, but the steps will be outlined below along with the final result.

<!-- end of the list -->

1. Substitute the actual kinematic motion equations into `d(t)` instead of just their identifiers.
2. Expand the entire expression under the radical (this will take a hot second).
3. Subsitute that for `d(t)` in the equation `d(t) = r1 + r2`.
4. Square both sides and subtract both by `r1 + r2`, yielding a quadratic polynomial set to 0.
5. Now combine all the terms with <code>t<sup>2</sup></code> together. Do the same with all the `t` terms and constant terms.
6. The result will be a quadratic equation that can be solved using traditional methods, namely the quadratic formula.

<!-- end of the list -->

Here's a [Desmos graph](https://www.desmos.com/calculator/y7s1hssxid) I created to prove that the discussed method works. Under the folder `Proportion Solve` you can find the quadratic setup and solution.
