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

typedef Vector2 Vec2Pair[2];

typedef enum RandColorScope
{
    ALL = 0,
    RAINBOW = 1
} RandColorScope;

typedef enum ObjectType
{
    Circle = 0,
    Rect = 1
} ObjectType;

typedef struct Object
{
    ObjectType type;
    Vector2 pos;
    Vector2 vel; // Pixels/sec
} Object;

typedef struct BallMotion
{
    Vector2 pos;
    Vector2 traj; // Velocity in pixels/sec
} BallMotion;

//render.c
Vector2 getFrameTraj(Vector2 traj);

//common.c
Color randomColor(RandColorScope scope);

//generation.c
void genTrajectories(BallMotion* ballMotions, int nBalls);
void genLocations(BallMotion* ballMotions, int nBalls, int radius);

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