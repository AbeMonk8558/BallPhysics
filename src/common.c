#include <raylib.h>
#include <math.h>
#include "ballPhysics.h"

bool floatEquals(float left, float right)
{
    // TODO: Enhance later
    return fabsf(left - right) <= 0.05f;
}

// TODO: Add full color scope.
Color randomColor(RandColorScope scope)
{
    static Color colors[] = { RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET };
    
    if (scope == RAINBOW) return colors[GetRandomValue(0, 6)];
    else return colors[GetRandomValue(0, sizeof(colors) / sizeof(Color) - 1)];
}

void DrawArrowV(Vector2 start, Vector2 end, float tipAngle, float tipLength, Color color)
{
    Vector2 slope = vecSub(start, end);
    Vector2 perp = { -slope.y, slope.x };

    float cross = crossProduct(perp, slope);
    float sign = cross / cross; // - = t1 counterclockwise, + = t1 clockwise

    Matrix2x2 t1Matrix = rotationMatrix(tipAngle * -sign);
    Matrix2x2 t2Matrix = rotationMatrix(tipAngle * sign);

    perp = vecScale(vecNormalize(perp), tipLength);
    Vector2 t1 = matrixVecMultiply(perp, t1Matrix);
    Vector2 t2 = matrixVecMultiply(vecInverse(perp), t2Matrix);

    DrawLineV(getRenderPos(start), getRenderPos(end), color);
    DrawLineV(getRenderPos(end), getRenderPos(vecAdd(end, t1)), color);
    DrawLineV(getRenderPos(end), getRenderPos(vecAdd(end, t2)), color);
}