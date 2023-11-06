#include <raylib.h>
#include <math.h>
#include "ballPhysics.h"

bool floatEquals(float left, float right)
{
    // TODO: Enhance later
    return fabsf(left - right) <= 0.05f;
}

// Checks if left is greater than right
bool looseFloatGt(float left, float right)
{
    return left > (right + 0.05f);
}

// Checks if left is less than right
bool looseFloatLt(float left, float right)
{
    return left < (right - 0.05f);
}

// TODO: Add full color scope.
Color randomColor(RandColorScope scope)
{
    static Color colors[] = { RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET };
    
    if (scope == RAINBOW) return colors[GetRandomValue(0, 6)];
    else return colors[GetRandomValue(0, sizeof(colors) / sizeof(Color) - 1)];
}