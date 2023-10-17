#pragma once

#include <raylib.h>
#include <stdbool.h>

/*
IMPORTANT NOTE: All mathematical operations are performed as if they were taking place on a standard
cartesian coordinate system (i-hat: <1, 0> and j-hat: <0, 1>). The coordinates are transformed
into the graphics "reflected-y-axis" (j-hat: <0, -1>) system at render time.
*/
//#define PRINT_BOUNCES

#define DEF_TARGET_FPS 30
#define LOG_LEVEL LOG_FATAL

typedef enum RandColorScope
{
    ALL = 0,
    RAINBOW = 1
} RandColorScope;

// *************** SEMI-GENERIC COLLISION SYSTEM *****************

typedef enum ObjectType
{
    OBJ_CIRCLE = 0,
    OBJ_RECT = 1
} ObjectType;

typedef struct Object
{
    ObjectType type;
    Vector2 pos;
    Vector2 vel; // Pixels/sec
    void* obj;
} Object;

typedef struct ObjectList
{
    Object* data;
    size_t size;
    size_t capacity;
} ObjectList;

typedef struct CircleObject
{
    float radius;
} CircleObject;

typedef struct RectObject
{
    Vector2 size;
    float rotation;
} RectObject;

// ***************************************************************

//render.c
Vector2 getFrameVel(Vector2 traj);
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
bool handleWallCollision(BallMotion* ballMotion, int radius, Vec2Pair dps);
bool handleBallCollision(BallMotion* ballMotions, int nBalls, int i, int radius, Vec2Pair dps);

//math.c
Vector2 vecAdd(Vector2 left, Vector2 right);
Vector2 vecSub(Vector2 left, Vector2 right);
Vector2 vecScale(Vector2 vec, float scalar);
float vecDist(Vector2 vec);