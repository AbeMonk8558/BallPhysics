#include <raylib.h>
#include <math.h>
#include "ballPhysics.h"
#include <stdio.h>

// Condensed bounce vector calculations using the method proposed
// at this link: https://stackoverflow.com/questions/573084/how-to-calculate-bounce-angle
Vector2 calcBounceVec(Vector2 d, float surfaceAngle)
{
    Vector2 n = { cosf(surfaceAngle), sinf(surfaceAngle) };

    return (Vector2){ 2.0f * n.x * (d.x * n.x + d.y * n.y) - d.x, 2.0f * n.y * (d.x * n.x + d.y * n.y) - d.y };
}

// Calculates the trajectory of a vector during a frame during which a bounce occurs by considering
// the trajectories both before and after the bounce and the proportion of the frame time
// after which the collision occurs.
Vector2 calcCollisionVec(Vector2 traj1, Vector2 traj2, float collisionProp)
{
    return vecAdd(vecScale(traj1, collisionProp), vecScale(traj2, (1.0f - collisionProp)));
}

bool handleWallCollision(BallMotion* ballMotion, int radius, Vec2Pair dps)
{   
    Vector2 d = getFrameTraj(ballMotion->traj);
    float collisionProp = 1.0f; // Proportion of travelDist until wall collision
    float bounceAngle;
    int w = GetScreenWidth() - 1, h = GetScreenHeight() - 1;

    Vector2 p = ballMotion->pos; // p (pos)
    Vector2 pp = vecAdd(p, d); // p (pos) p (prime)

    if (pp.x - radius < 0)
    {
        // d.x will be negative here (moving left)
        collisionProp = (p.x - radius) / -d.x;
        bounceAngle = PI / 2.0f;
    }
    else if (pp.x + radius > w)
    {
        collisionProp = (w - (p.x + radius)) / d.x;
        bounceAngle = PI / 2.0f;
    }
    else if (pp.y - radius < 0)
    {
        // d.y will be negative here (moving down)
        collisionProp = (p.y - radius) / -d.y;
        bounceAngle = 0.0f;
    }
    else if (pp.y + radius > h)
    {
        collisionProp = (h - (p.y + radius)) / d.y;
        bounceAngle = 0.0f;
    }
    
    if (collisionProp < 1)
    {
        dps[0] = calcBounceVec(ballMotion->traj, bounceAngle); 
        dps[1] = calcCollisionVec(ballMotion->traj, dps[0], collisionProp);

#ifdef PRINT_BOUNCES
        printf("-----------------WALL---------------\n");
        printf("Travel Dist: %f\n", travelDist);
        printf("Collision Prop: %f\n", collisionProp);
        printf("Vector d: [%f, %f]\n", d->x, d->y);
        printf("Vector d-prime: [%f, %f]\n", dp.x, dp.y);
        printf("Bounce Travel Dist: %lf\n", VEC_DIST_V(*d));
        printf("------------------------------------\n");
#endif

        return true;
    }

    return false;
}

bool handleBallCollision(BallMotion* ballMotions, int nBalls, int idx, int radius, Vec2Pair dps)
{
    int i;
    float begDist, endDist, collisionProp, tanLnAngle; // The tangent line between the 2 balls when they collide

    Vector2 d = getFrameTraj(ballMotions[idx].traj);
    Vector2 p = ballMotions[idx].pos, pp = vecAdd(p, d);
    Vector2 d2, p2, pp2;

    for (i = 0; i < nBalls; i++)
    {
        if (i == idx) continue;

        d2 = getFrameTraj(ballMotions[i].traj);
        p2 = ballMotions[i].pos;
        pp2 = vecAdd(p2, d2);

        begDist = vecDist(vecSub(p, p2));
        endDist = vecDist(vecSub(pp, pp2));

        if (endDist >= begDist || endDist >= radius * 2) continue;

        collisionProp = (radius * 2 - begDist) / (endDist - begDist);

        // Calculates median line between two vector trajectories. Note that this
        // only works if the vectors are the same length. If at any point this simulation
        // gets updated such that the balls travel at different speeds, then the unit trajectory
        // vectors will likely have to be used in this calculation.
        tanLnAngle = atan2f(d.y + d2.y, d.x + d2.x);

        dps[0] = calcBounceVec(ballMotions[idx].traj, tanLnAngle);
        dps[1] = calcCollisionVec(ballMotions[i].traj, dps[0], collisionProp);

#ifdef PRINT_BOUNCES
        printf("----------------BALL----------------\n");
        printf("Ball Index: %d\n", idx);
        printf("Collision Angle (deg): %f\n", tanLnAngle * (180 / PI));
        printf("Collision Proportion: %f\n", collisionProp);
        printf("Vector d: [%f, %f]\n", d->x, d->y);
        printf("Vector d-prime: [%f, %f]\n", dp.x, dp.y);
        printf("------------------------------------\n");
#endif

        return true;
    }

    return false;
}

void handleCollisions(Object* objects, int nObjects)