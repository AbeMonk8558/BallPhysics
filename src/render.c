#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include "ballPhysics.h"

static ObjectList objects;
static Vector2* dps;
static int targetFPS, nBalls, radius;
static float speedMod;

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

    objects.size = 0;
    objects.capacity = nBalls + 4; // Includes the 4 bounding walls
    objects.data = (Object*)malloc(objects.capacity * sizeof(Object));

    bool paused = false;
    Color backgroundColor = BLACK;
    KeyboardKey key;
    Vector2 mousePos;
    int i;

    SetTraceLogLevel(LOG_LEVEL);

    InitWindow(500, 500, argv[0]);
    SetExitKey(KEY_ESCAPE);
    SetTargetFPS(targetFPS);

    for (i = 0; i < nBalls; i++)
        addCircleObject((Vector2){0}, (Vector2){0}, 10.0f);

    genTrajectories(objects);
    genLocations(objects);

    // Adding the 4 edge walls
    addRectObject((Vector2){0, 0}, (Vector2){0, 0}, (Vector2){0, GetScreenHeight()}, 0.0f);
    addRectObject((Vector2){0, 0}, (Vector2){0, 0}, (Vector2){GetScreenWidth(), 0}, 0.0f);
    addRectObject((Vector2){GetScreenWidth(), 0}, (Vector2){0, 0}, (Vector2){0, GetScreenHeight()}, 0.0f);
    addRectObject((Vector2){0, GetScreenHeight()}, (Vector2){0, 0}, (Vector2){GetScreenWidth(), 0}, 0.0f);

    while (!WindowShouldClose())
    {
        key = GetKeyPressed();
        mousePos = GetMousePosition();

        handlePause(&paused, key);
        handleSpeedMod(&speedMod, key);
        handleLineCreation(mousePos);

        BeginDrawing();

        ClearBackground(backgroundColor);

        for (i = 0; i < objects.size; i++)
            handleCollisions(objects, i);
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
            DrawCircleV(getRenderPos(obj->pos), circle->radius, RED);
        }
        else if (obj->type == OBJ_RECT)
        {
            RectObject* rect = (RectObject*)obj->obj;
            DrawRectangleV(getRenderPos(obj->pos), rect->size, WHITE);
        }

        if (!vecComp(obj->vel, obj->baseVel))
            obj->vel = obj->baseVel;
    }
}

// ******************************************************

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