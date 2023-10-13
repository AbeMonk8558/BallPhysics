#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include "ballPhysics.h"

#include <stdio.h>
#include <math.h>

static BallMotion* ballMotions;
static int targetFPS, nBalls, radius;
static float speedMod;

void simBallMotion(Vec2Pair* dps);
Vector2 getRenderPos(Vector2 pos);

Vector2 calcBounceVec(Vector2 d, float surfaceAngle);
int main(int argc, char** argv)
{
    // Vector2 vec1 = { 5, 1 };
    // printf("<%f, %f>\n", vec1.x, vec1.y);
    // Vector2 vec2 = calcBounceVec(vec1, 50 * (PI/180));
    // printf("<%f, %f>\n", vec2.x, vec2.y);
    // printf("%f\n", atan2f(1, 0));
    // return 0;

    nBalls = 2;
    speedMod = 1.0f;
    radius = 10;
    targetFPS = DEF_TARGET_FPS;
    ballMotions = (BallMotion*)malloc(nBalls * sizeof(BallMotion));

    bool paused = false;
    Color backgroundColor = BLACK;
    KeyboardKey key;

    // d-primes -- the trajectory modifications after each frame.
    // When the ball bounces, there will be a normal trajectory and a special 
    // bounce trajectory for that frame: [base traj, special-case traj].
    Vec2Pair* dps;
    int i;

    SetTraceLogLevel(LOG_LEVEL);

    InitWindow(500, 500, argv[0]);
    SetExitKey(KEY_ESCAPE);
    SetTargetFPS(targetFPS);

    genTrajectories(ballMotions, nBalls);
    genLocations(ballMotions, nBalls, radius);

    dps = (Vec2Pair*)malloc(nBalls * sizeof(Vec2Pair));
    for (i = 0; i < nBalls; i++)
        dps[i][0] = dps[i][1] = ballMotions[i].traj;

    while (!WindowShouldClose())
    {
        key = GetKeyPressed();

        handlePause(&paused, key);
        handleSpeedMod(&speedMod, key);

        BeginDrawing();

        if (!paused)
        {
            ClearBackground(backgroundColor);
            simBallMotion(dps);
        }

        EndDrawing();
    }

    free(dps);
    free(ballMotions);

    return EXIT_SUCCESS;
}

void simBallMotion(Vec2Pair* dps)
{
    int i;
    Vector2 d; // d = delta

    for (i = 0; i < nBalls; i++)
    {
        if (!(handleWallCollision(&ballMotions[i], radius, dps[i]) ||
            handleBallCollision(ballMotions, nBalls, i, radius, dps[i])))
        {
            dps[i][1] = dps[i][0]; // If there's no special trajectory for a bounce, than mod it to the base one.
        }
    }

    // Trajectories can only be modified after all calculations for the frame have been run --
    // balls depend on each other's trajectories to calculate bounce vectors.
    for (i = 0; i < nBalls; i++)
    {   
        d = getFrameTraj(dps[i][1]);
        ballMotions[i].pos.x += d.x;
        ballMotions[i].pos.y += d.y;

        DrawCircleV(getRenderPos(ballMotions[i].pos), radius, RED);
        ballMotions[i].traj = dps[i][0];
    }
}

Vector2 getRenderPos(Vector2 pos)
{
    // Modifies for the inverted y-axis in the graphics plane
    return (Vector2){ pos.x, GetScreenHeight() - pos.y - 1 };
}

// ********************** Globally accessible ****************************

Vector2 getFrameTraj(Vector2 traj)
{
    // Gets the trajectory modified for a single frame
    return (Vector2){ traj.x / targetFPS * speedMod, traj.y / targetFPS * speedMod };
}