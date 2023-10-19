#pragma once

#include <raylib.h>
#include <stdbool.h>

/*
IMPORTANT NOTE: All mathematical operations are performed as if they were taking place on a standard
cartesian coordinate system (i-hat: <1, 0> and j-hat: <0, 1>). The coordinates are transformed
into the graphics "reflected-y-axis" (j-hat: <0, -1>) system at render time.
*/

// ************ SETUP ******************
#define DEF_TARGET_FPS 30
#define LOG_LEVEL LOG_FATAL
#define EPSILON // https://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/
// HANDLE FLOAT COMPARISONS CORRECTLY ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// ************************************

// ********** FOR TESTING **************
#define USE_GEN 0
// *************************************

#define NO_CLSN ((Collision){ -1.0f, -1.0f })
#define VEC2_ZERO ((Vector2){ 0.0f, 0.0f })

typedef enum RandColorScope
{
    ALL = 0,
    RAINBOW = 1
} RandColorScope;

// *************** SEMI-GENERIC OBJECT SYSTEM *****************

typedef enum ObjectType
{
    OBJ_CIRCLE = 0,
    OBJ_RECT = 1
} ObjectType;

typedef struct Object
{
    ObjectType type;
    Vector2 pos; // <-- Bottom-right corner for rectangles
    Vector2 vel; // Pixels/sec
    void* typeObj;
} Object;

typedef struct ObjectList
{
    Object* data;
    int size;
    int capacity;
} ObjectList;

typedef struct CircleObject
{
    float radius;
} CircleObject;

typedef struct RectObject
{
    Vector2 size;
    float rotation; // Rotation around centroid
} RectObject;

// ***************************************************************

typedef struct Collision
{
    float prop;
    float tanAngle;
} Collision;

//render.c
Vector2 getFrameVel(Vector2 vel);
void addCircleObject(Vector2 pos, Vector2 vel, float radius);
void addRectObject(Vector2 pos, Vector2 vel, Vector2 size, float rotation);

//common.c
Color randomColor(RandColorScope scope);

//generation.c
void genTrajectories(ObjectList objects);
void genLocations(ObjectList objects);

//user.c
void handleSpeedMod(float* speedMod, KeyboardKey key);
void handlePause(bool* paused, KeyboardKey key);
void handleLineCreation(Vector2 mousePos);

//collision.c
Collision findCollisions(ObjectList objects, int idx);
Vector2 calcBounceVec(Vector2 d, float surfaceAngle);
Vector2 calcCollisionVec(Vector2 vel1, Vector2 vel2, float collisionProp);
bool isCollision(Collision clsn);

//math.c
Vector2 vecAdd(Vector2 left, Vector2 right);
Vector2 vecSub(Vector2 left, Vector2 right);
Vector2 vecScale(Vector2 vec, float scalar);
float vecDist(Vector2 vec);
bool vecComp(Vector2 left, Vector2 right);