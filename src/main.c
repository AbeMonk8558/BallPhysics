#include <math.h>
#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include "ball_physics.h"

#include <stdio.h>

BallMotion* ballMotions;
int nBalls, radius;

static Color backgroundColor;
static int targetFPS;
static double speedMod;

void simBallMotion(void);
Vector2 calcBounceVec(int ballIdx, double surfaceAngle);

void test(const char* prgrmName)
{
    InitWindow(100, 100, prgrmName);

    BeginDrawing();
    DrawCircleV((Vector2){ 50, 50 }, 10, RED);
    EndDrawing();
    WaitTime(1);

    BeginDrawing();
    DrawCircleV((Vector2){ 50, 50 }, 10, BLACK);
    DrawCircleV((Vector2){ 55, 55 }, 10, RED);
    EndDrawing();
    WaitTime(5);

    exit(EXIT_SUCCESS);
}

int main(int argc, char** argv)
{
    //test(argv[0]);

    nBalls = 1;
    speedMod = 1.0;
    radius = 10;
    backgroundColor = BLACK;
    targetFPS = DEF_TARGET_FPS;
    ballMotions = (BallMotion*)malloc(nBalls * sizeof(BallMotion));

    SetTraceLogLevel(LOG_FATAL);

    InitWindow(500, 500, argv[0]);
    SetExitKey(KEY_ESCAPE);
    SetTargetFPS(targetFPS);

    genTrajectories();
    genLocations();

    while (!WindowShouldClose())
    {
        BeginDrawing();
        
        handleSpeedMod(&speedMod);
        
        ClearBackground(backgroundColor);
        simBallMotion();

        EndDrawing();
    }

    free(ballMotions);

    return EXIT_SUCCESS;
}

void simBallMotion(void)
{
    int i, w, h;
    double collisionDist, travelDist, x, y, dx, dy, bounceAngle;
    Vector2 bounceVec;

    for (i = 0; i < nBalls; i++)
    {
        dx = ballMotions[i].traj.x / targetFPS * speedMod, dy = ballMotions[i].traj.y / targetFPS * speedMod;
        x = ballMotions[i].pos.x + dx, y = ballMotions[i].pos.y - dy;

        w = GetScreenWidth() - 1, h = GetScreenHeight() - 1;

        travelDist = VEC_DIST(dx, dy);
        collisionDist = travelDist;

        if (x + radius > w)
        {
            collisionDist *= (w - (x + radius)) / dx;
            bounceAngle = PI / 2;
        }
        else if (x - radius < 0)
        {
            collisionDist *= (x - radius) / dx;
            bounceAngle = PI / 2;
        }
        else if (y + radius > h)
        {
            collisionDist *= (h - (y + radius)) / dy;
            bounceAngle = 0;
        }
        else if (y - radius < 0)
        {
            collisionDist *= (y - radius) / dy;
            bounceAngle = 0;
        }
        
        if (collisionDist < travelDist)
        {
            ballMotions[i].traj = calcBounceVec(i, bounceAngle);

            dx = collisionDist * dx + (travelDist - collisionDist) * (ballMotions[i].traj.x / targetFPS * speedMod);
            dy = collisionDist * dy + (travelDist - collisionDist) * ( ballMotions[i].traj.y / targetFPS * speedMod);
        }

        ballMotions[i].pos.x += dx;
        ballMotions[i].pos.y -= dy;

        DrawCircleV(ballMotions[i].pos, radius, RED);
    }
}

Vector2 calcBounceVec(int ballIdx, double surfaceAngle)
{
    double x = ballMotions[ballIdx].traj.x, y = ballMotions[ballIdx].traj.y;
    double a = cos(surfaceAngle), b = sin(surfaceAngle);

    // Condensed bounce vector calculations
    return (Vector2){ 2.0 * a * (x * a + y * b) - x, 2.0 * b * (x * a + y * b) - y };
}