#include <raylib.h>
#include <math.h>
#include <memory.h>
#include "ballPhysics.h"

void genTrajectories(ObjectList objects)
{
    int i;

    for (i = 0; i < objects.size - 4; i++)
    {
        // if (i == 0) ballMotions[i].traj = (Vector2){ 0, 50 };
        // else if (i == 1) ballMotions[i].traj = (Vector2){ 0, -50 };
        if (i == 0) objects.data[i].vel = (Vector2){ -50, 0 };
        else if (i == 1) objects.data[i].vel = (Vector2){ -50 * cosf(PI/4), -50 * sinf(PI/4) };
    }
}

// TODO - Maybe use poisson disk randomization later
void genLocations(ObjectList objects)
{
    int i;

    for (i = 0; i < objects.size - 4; i++)
    {
        // if (i == 0) ballMotions[i].pos = (Vector2){ GetScreenWidth() / 2, radius };
        // else if (i == 1) ballMotions[i].pos = ballMotions[i].pos = (Vector2){ GetScreenWidth() / 2, GetScreenHeight() - radius - 1 };
        if (i == 0) objects.data[i].pos = (Vector2){ 200, 50 };
        else if (i == 1) objects.data[i].pos = (Vector2){ 50 + 150 * cosf(PI/4), 50 + 150 * sinf(PI/4) };
    }
}