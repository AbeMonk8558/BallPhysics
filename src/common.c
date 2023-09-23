#include <raylib.h>
#include <math.h>
#include "ball_physics.h"

// TODO: Add full color scope.
Color randomColor(RandColorScope scope)
{
    static Color colors[] = { RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET };
    
    if (scope == RAINBOW) return colors[GetRandomValue(0, 6)];
    else return colors[GetRandomValue(0, sizeof(colors) / sizeof(Color) - 1)];
}