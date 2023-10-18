#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include "ballPhysics.h"

static ObjectList objects;
static int targetFPS, nBalls, radius;
static float speedMod;

Vector2 getRenderPos(Vector2 pos);
float getRenderRotation(float rotation); // <-- Reversed due to x-axis reflection

void renderObjects(void);
void freeObjects(void);
void handleObjectsResize(void);

int main(int argc, char** argv)
{
    speedMod = 0.0f;
    targetFPS = 1;
    objects.capacity = 1;
    objects.size = 0;
    objects.data = (Object*)malloc(sizeof(Object));
    SetTraceLogLevel(LOG_FATAL);
    InitWindow(500, 500, "Test");
    addRectObject((Vector2){ 250, 250 }, (Vector2){ 0 }, (Vector2){ 50, 100 }, 0);
    addRectObject((Vector2){ 250, 250 }, (Vector2){ 0 }, (Vector2){ 50, 100 }, 180.0f);
    BeginDrawing();
    renderObjects();
    EndDrawing();
    WaitTime(10);
    CloseWindow();
    return 0;

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
        addCircleObject((Vector2){ 0 }, (Vector2){ 0 }, 10.0f);

    genTrajectories(objects);
    genLocations(objects);

    // Adding the 4 edge walls
    addRectObject((Vector2){ 0 }, (Vector2){ 0 }, (Vector2){ 0, GetScreenHeight() }, 0.0f);
    addRectObject((Vector2){ 0 }, (Vector2){ 0 }, (Vector2){ GetScreenWidth(), 0 }, 0.0f);
    addRectObject((Vector2){ GetScreenWidth(), 0 }, (Vector2){ 0 }, (Vector2){ 0, GetScreenHeight() }, 0.0f);
    addRectObject((Vector2){ 0, GetScreenHeight() }, (Vector2){ 0 }, (Vector2){ GetScreenWidth(), 0 }, 0.0f);

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

    CloseWindow();
    freeObjects();

    return EXIT_SUCCESS;
}

// ******************** GENERIC OBJECT HANDLING ********************

void addCircleObject(Vector2 pos, Vector2 vel, float radius)
{
    Object* obj;

    handleObjectsResize();
    obj = &objects.data[objects.size++];

    *obj = (Object){ .type = OBJ_CIRCLE, .pos = pos, .vel = vel, .baseVel = vel, .typeObj = malloc(sizeof(CircleObject)) };
    *((CircleObject*)obj->typeObj) = (CircleObject){ .radius = radius };
}

void addRectObject(Vector2 pos, Vector2 vel, Vector2 size, float rotation)
{
    Object* obj;

    handleObjectsResize();
    obj = &objects.data[objects.size++];

    *obj = (Object){ .type = OBJ_RECT, .pos = pos, .vel = vel, .baseVel = vel, .typeObj = malloc(sizeof(RectObject)) };
    *((RectObject*)obj->typeObj) = (RectObject){ .size = size, .rotation = rotation };
}

void handleObjectsResize(void)
{
    if (objects.size < objects.capacity) return;

    objects.capacity *= 2;
    objects.data = (Object*)realloc(objects.data, objects.capacity * sizeof(Object));
}

void freeObjects(void)
{
    int i;

    for (i = 0; i < objects.size; i++)
        free(objects.data[i].typeObj);

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
            CircleObject* obj_C = (CircleObject*)obj->typeObj;
            DrawCircleV(getRenderPos(obj->pos), obj_C->radius, RED);
        }
        else if (obj->type == OBJ_RECT)
        {
            // Below math: The DrawRectanglePro function rotates around the top-left corner.
            // The rotation stored in this program's RectObject struct is a rotation around
            // the centroid. Hence, a conversion must be performed.
            RectObject* obj_R = (RectObject*)obj->typeObj;

            float w = obj_R->size.x, h = obj_R->size.y;
            float diagDist = vecDist((Vector2){ w, h });
            float n = obj_R->rotation;

            Vector2 c1 = vecScale((Vector2){ w, h }, 0.5f);
            Vector2 c2 = vecScale((Vector2){ diagDist * cosf(atan2f(h, w) + n), diagDist * sinf(atan2f(h, w) + n) }, 0.5f);
            Vector2 cDiff = vecSub(c2, c1);

            // New position after rotation and translation to top-left corner
            Vector2 rPos = getRenderPos(vecSub((Vector2){ obj->pos.x, obj->pos.y + h }, cDiff));

            DrawRectanglePro(
                (Rectangle){ rPos.x, rPos.y, w, h }, 
                (Vector2){ 0, 0 },
                n,
                WHITE);
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

float getRenderRotation(float rotation)
{
    return -rotation;
}

Vector2 getFrameVel(Vector2 traj)
{
    // Gets the trajectory modified for a single frame
    return vecScale(traj, speedMod / targetFPS);
}