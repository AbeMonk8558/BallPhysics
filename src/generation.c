#include <math.h>
#include <raylib.h>
#include "ball_physics.h"

void genTrajectories(void)
{
    int i;

    for (i = 0; i < nBalls; i++)
    {
        ballMotions[i].traj = (Vector2){ cos(PI / 4) * 50, sin(PI / 4) * 50 };
    }
}

// TODO - Maybe use poisson disk randomization later
void genLocations(void)
{
    int i;

    for (i = 0; i < nBalls; i++)
    {
        ballMotions[i].pos = (Vector2){ 250, 300 };
    }
}