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
//#define TESTING
#define USE_GEN 1
// *************************************

#define NO_CLSN ((Collision){ -1.0f, 0.0f }) // The frame-delta proportion until collision can't be negative.
#define VEC2_ZERO ((Vector2){ 0.0f, 0.0f })

#define MIN(left, right) ((left) < (right) ? (left) : (right))
#define MAX(left, right) ((left) > (right) ? (left) : (right))

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

typedef struct AABBox // (Axis-aligned bounding box)
{
    Vector2 pos;
    Vector2 size;
} AABBox;

typedef struct Matrix2x2
{
    float a;
    float b;
    float c;
    float d;
} Matrix2x2;

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
bool vecComp(Vector2 left, Vector2 right);
Vector2 vecAdd(Vector2 left, Vector2 right);
Vector2 vecSub(Vector2 left, Vector2 right);
Vector2 vecScale(Vector2 vec, float scalar);
float vecDist(Vector2 vec);
Vector2 vecInverse(Vector2 vec);
float dotProduct(Vector2 left, Vector2 right);
Vector2 vecNormalize(Vector2 vec);
Vector2 vecProj(Vector2 surface, Vector2 vec);
Vector2 pointLineProj(Vector2 line, Vector2 point);

Vector2 matrixVecMultiply(Vector2 vec, Matrix2x2 matrix);
Matrix2x2 matrixFromVectors(Vector2 xVec, Vector2 yVec);
Matrix2x2 rotationMatrix(float angle);

Vector2 calcCentroid(Object* obj);
Vector2 getRectVertices(Object* rObj, Vector2 vertices[4]);
Vector2 calcIntersection(Vector2 pos1, Vector2 vel1, Vector2 pos2, Vector2 vel2);