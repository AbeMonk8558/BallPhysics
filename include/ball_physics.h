#pragma once

#define DEF_TARGET_FPS 30
#define LOG_LEVEL

#define VEC_DIST_V(vec) sqrt(vec.x * vec.x + vec.y * vec.y)
#define VEC_DIST(x, y) sqrt(x * x + y * y)

typedef enum RandColorScope
{
    ALL = 0,
    RAINBOW = 1
} RandColorScope;

typedef struct BallMotion
{
    Vector2 pos;
    Vector2 traj; // Velocity in pixels/sec
} BallMotion;

//main.c
extern BallMotion* ballMotions;
extern int nBalls;

//common.c
Color randomColor(RandColorScope scope);

//generation.c
void genTrajectories(void);
void genLocations(void);

//user.c
void handleSpeedMod(double* speedMod);