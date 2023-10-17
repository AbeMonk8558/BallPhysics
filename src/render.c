#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include "ballPhysics.h"

static ObjectList objects;
static Vector2* dps;
static int targetFPS, nBalls, radius;
static float speedMod;

void simBallMotion(void);
Vector2 getRenderPos(Vector2 pos);

void renderObjects(void);
void freeObjects(void);
void addObject(Object obj);

int main(int argc, char** argv)
{
    nBalls = 2;
    speedMod = 1.0f;
    radius = 10;
    targetFPS = DEF_TARGET_FPS;

    objects.capacity = nBalls + 4; // Includes the 4 bounding walls
    objects.data = (Object*)malloc(objects.capacity * sizeof(Object));

    bool paused = false;
    Color backgroundColor = BLACK;
    KeyboardKey key;
    Vector2 mousePos;

    // d-primes -- the trajectory modifications after each frame.
    // When the ball bounces, there will be a normal trajectory and a special 
    // bounce trajectory for that frame: [base traj, special-case traj].
    Vector2* dps = (Vector2*)malloc(nBalls * sizeof(Vector2));
    int i;

    SetTraceLogLevel(LOG_LEVEL);

    InitWindow(500, 500, argv[0]);
    SetExitKey(KEY_ESCAPE);
    SetTargetFPS(targetFPS);

    genTrajectories(objects);
    genLocations(objects);

    for (i = 0; i < nBalls; i++)
    {
        
    }

    while (!WindowShouldClose())
    {
        key = GetKeyPressed();
        mousePos = GetMousePosition();

        handlePause(&paused, key);
        handleSpeedMod(&speedMod, key);
        handleLineCreation(mousePos);

        BeginDrawing();

        if (!paused)
        {
            simBallMotion();
        }

        ClearBackground(backgroundColor);
        renderObjects();

        EndDrawing();
    }

    freeObjects();
    free(dps);

    return EXIT_SUCCESS;
}

// ******************** GENERIC OBJECT HANDLING ********************

void addCircleObject(Vector2 pos, Vector2 vel, float radius)
{
    Object obj = { .type = OBJ_CIRCLE, .pos = pos, .vel = vel };
    CircleObject circle = { .radius = radius };

    obj.obj = malloc(sizeof(CircleObject));
    *((CircleObject*)obj.obj) = circle;
}

void addRectObject(Vector2 pos, Vector2 vel, Vector2 size, float rotation)
{
    Object obj = { .type = OBJ_RECT, .pos = pos, .vel = vel };
    RectObject rect = { .size = size, .rotation = rotation };

    obj.obj = malloc(sizeof(RectObject));
    *((RectObject*)obj.obj) = rect;
}

void addObject(Object obj)
{
    if (objects.size >= objects.capacity)
    {
        objects.capacity *= 2;
        objects.data = (Object*)realloc(objects.data, objects.capacity * sizeof(Object));
    }

    objects.data[objects.size++] = obj;
}

void freeObjects(void)
{
    int i;

    for (i = 0; i < objects.size; i++)
        free(objects.data[i].obj);

    free(objects.data);
}

void renderObjects(void)
{
    int i;
    Vector2 d;
    Object* obj;

    for (i = 0; i < objects.size; i++)
    {
        obj = &objects.data[i];
        d = getFrameVel(objects.data[i].vel);

        obj->pos = vecAdd(obj->pos, d);

        if (obj->type == OBJ_CIRCLE)
        {
            CircleObject* circle = (CircleObject*)obj->obj;
            DrawCircleV(obj->pos, circle->radius, RED);
        }
        else if (obj->type == OBJ_RECT)
        {
            RectObject* rect = (RectObject*)obj->obj;
            DrawRectangleV(obj->pos, rect->size, WHITE);
        }
    }
}

// ******************************************************

void simBallMotion(void)
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
        ballMotions[i].pos = vecAdd(ballMotions[i].pos, d);

        DrawCircleV(getRenderPos(ballMotions[i].pos), radius, RED);
        ballMotions[i].traj = dps[i][0];
    }
}

Vector2 getRenderPos(Vector2 pos)
{
    // Modifies for the inverted y-axis in the graphics plane
    return (Vector2){ pos.x, GetScreenHeight() - pos.y - 1 };
}

Vector2 getFrameVel(Vector2 traj)
{
    // Gets the trajectory modified for a single frame
    return vecScale(traj, speedMod / targetFPS);
}