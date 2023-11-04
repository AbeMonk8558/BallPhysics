# BallPhysics
A highly-customizable 2D ball physics simulation created with Raylib (currently nowhere near completion). Uses continuous collision detection for hyper-accurate collisions.

## Overview
In the future, the math behind the continuous collision detection will be explained here. The simulation does not currently account for acceleration, though will in the future.

### Circle-circle
1. Let `a` and `b` be the initial positions of 2 circles.
2. Let `u` and `v` be the velocities of the 2 circles.
3. Let `t` measure elapsed time since the initial positions.
4. To find the position of a circle along a dimension (x or y), use the kinematic motion equation <code>p<sub>i</sub>(t) = a<sub>i</sub> + v<sub>i</sub> * t</code>, where `i` is a dimension.
5. To find the distance between any 2 points, use Euler's distance formula subsituted with the kinematic motion equation: 
