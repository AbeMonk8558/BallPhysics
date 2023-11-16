#include <raylib.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include "ballPhysics.h"

#include <stdio.h>

static ObjectList objects; 
static Collision* collisions;
static int targetFPS, nBalls, radius;
static float speedMod;

Vector2 getRenderPos(Vector2 pos);
float getRenderRotation(float rotation); // <-- Reversed due to x-axis reflection

void updateObjectStates(void);
void renderObjects(void);
void freeObjects(void);
void handleObjectsResize(void);

#ifdef TESTING
    #include "test.h"
#else
int main(int argc, char** argv)
{
    nBalls = 2;
    speedMod = 1.0f;
    radius = 10;
    targetFPS = DEF_TARGET_FPS;

    bool paused = false;
    Color backgroundColor = BLACK;
    KeyboardKey key;
    Vector2 mousePos;
    int i;

    SetTraceLogLevel(LOG_LEVEL);

    InitWindow(500, 500, argv[0]);
    SetExitKey(KEY_ESCAPE);
    SetTargetFPS(targetFPS);

    // ********************** OBJECT SETUP **************************
    objects.size = 0;
    objects.capacity = nBalls + 4; // Includes the 4 bounding walls
    objects.data = (Object*)malloc(objects.capacity * sizeof(Object));
    collisions = (Collision*)malloc(objects.capacity * sizeof(Collision));

    for (i = 0; i < nBalls; i++)
        addCircleObject(VEC2_ZERO, VEC2_ZERO, 20.0f);

    genTrajectories(objects);
    genLocations(objects);

    // Adding the 4 edge walls
    addRectObject(VEC2_ZERO, VEC2_ZERO, (Vector2){ 1, GetScreenHeight() }, 0.0f);
    addRectObject(VEC2_ZERO, VEC2_ZERO, (Vector2){ GetScreenWidth(), 1 }, 0.0f);
    addRectObject((Vector2){ GetScreenWidth() - 1, 0 }, VEC2_ZERO, (Vector2){ 1, GetScreenHeight() }, 0.0f);
    addRectObject((Vector2){ 0, GetScreenHeight() }, VEC2_ZERO, (Vector2){ GetScreenWidth(), 0 }, 0.0f);
    // ******************************************************************

    while (!WindowShouldClose())
    {
        key = GetKeyPressed();
        mousePos = GetMousePosition();

        handlePause(&paused, key);
        handleSpeedMod(&speedMod, key);
        handleLineCreation(mousePos);

        if (!paused)
        {
            for (i = 0; i < objects.size; i++)
                collisions[i] = findCollisions(objects, i);

            updateObjectStates();
        }

        BeginDrawing();

        ClearBackground(backgroundColor);
        renderObjects();

        EndDrawing();
    }

    CloseWindow();
    freeObjects();
    free(collisions);

    return EXIT_SUCCESS;
}
#endif

// ******************** GENERIC OBJECT HANDLING ********************

void addCircleObject(Vector2 pos, Vector2 vel, float radius)
{
    Object* obj;

    handleObjectsResize();
    collisions[objects.size] = NO_CLSN;
    obj = &objects.data[objects.size++];

    *obj = (Object){ .type = OBJ_CIRCLE, .pos = pos, .vel = vel, .typeObj = malloc(sizeof(CircleObject)) };
    *((CircleObject*)obj->typeObj) = (CircleObject){ .radius = radius };
}

void addRectObject(Vector2 pos, Vector2 vel, Vector2 size, float rotation)
{
    Object* obj;

    handleObjectsResize();
    collisions[objects.size] = NO_CLSN;
    obj = &objects.data[objects.size++];

    *obj = (Object){ .type = OBJ_RECT, .pos = pos, .vel = vel, .typeObj = malloc(sizeof(RectObject)) };
    *((RectObject*)obj->typeObj) = (RectObject){ .size = size, .rotation = rotation };
}

void handleObjectsResize(void)
{
    if (objects.size < objects.capacity) return;

    objects.capacity *= 2;
    objects.data = (Object*)realloc(objects.data, objects.capacity * sizeof(Object));
    collisions = realloc(collisions, objects.capacity * sizeof(Collision));
}

void freeObjects(void)
{
    int i;

    for (i = 0; i < objects.size; i++)
        free(objects.data[i].typeObj);

    free(objects.data);
}

void updateObjectStates(void)
{
    int i;
    Vector2 d;
    Collision* clsn;
    Object* obj;

    for (i = 0; i < objects.size; i++)
    {
        obj = &objects.data[i];
        clsn = &collisions[i];

        if (isCollision(*clsn))
        {
            d = getFrameVel(calcCollisionVec(obj->vel, clsn->outVel, clsn->prop));
            obj->vel = clsn->outVel;

            *clsn = NO_CLSN;
        }
        else
        {
            d = getFrameVel(obj->vel);
        }

        obj->pos = calcMotion(obj->pos, d);
    }
}

void renderObjects(void)
{
    int i;
    Object* obj;

    for (i = 0; i < objects.size; i++)
    {
        obj = &objects.data[i];

        if (obj->type == OBJ_CIRCLE)
        {
            //printf("Rendering circle at (%f, %f).\n", obj->pos.x, obj->pos.y);

            CircleObject* obj_C = (CircleObject*)obj->typeObj;
            DrawCircleV(getRenderPos(obj->pos), obj_C->radius, RED);
        }
        else if (obj->type == OBJ_RECT)
        {
            // Below math: The DrawRectanglePro function rotates around the top-left corner.
            // The rotation stored in this program's RectObject struct is a rotation around
            // the centroid. Hence, a conversion must be performed.
            RectObject* obj_R = (RectObject*)obj->typeObj;
            Vector2 vertices[4], rPos;
            float w = obj_R->size.x, h = obj_R->size.y, r = obj_R->rotation;

            getRectVertices(obj, vertices);
            rPos = getRenderPos(vertices[3]);

            DrawRectanglePro(
                (Rectangle){ rPos.x, rPos.y, w, h }, 
                VEC2_ZERO,
                getRenderRotation(r),
                WHITE);
        }
    }
}

// ******************************************************

Vector2 getStandardPos(Vector2 renderPos)
{
    return (Vector2){ renderPos.x, GetScreenHeight() - renderPos.y - 1 };
}

Vector2 getRenderPos(Vector2 pos)
{
    // Modifies for the inverted y-axis in the graphics plane
    return (Vector2){ pos.x, GetScreenHeight() - pos.y - 1 };
}

float getRenderRotation(float rotation)
{
    return -(rotation * RAD2DEG);
}

Vector2 getFrameVel(Vector2 vel)
{
    // Gets the trajectory modified for a single frame
    return vecScale(vel, speedMod / targetFPS);
}