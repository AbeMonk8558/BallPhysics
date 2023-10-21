#include <raylib.h>
#include <stdbool.h>
#include <math.h>
#include "ballPhysics.h" 

// ************* General *******************

bool floatComp(float left, float right)
{
    //TODO
}

// **********************************************
// ************* Basic vector *******************

bool vecComp(Vector2 left, Vector2 right)
{
    return (left.x == right.x) && (left.y == right.y);
}

Vector2 vecAdd(Vector2 left, Vector2 right)
{
    return (Vector2){left.x + right.x, left.y + right.y};
}

Vector2 vecSub(Vector2 left, Vector2 right)
{
    return (Vector2){left.x - right.x, left.y - right.y};
}

Vector2 vecScale(Vector2 vec, float scalar)
{
    return (Vector2){vec.x * scalar, vec.y * scalar};
}

float vecDist(Vector2 vec)
{
    return sqrtf(vec.x * vec.x + vec.y * vec.y);
}

Vector2 vecInverse(Vector2 vec)
{
    return (Vector2){-vec.x, -vec.y};
}

float dotProduct(Vector2 left, Vector2 right)
{
    return left.x * right.x + left.y * right.y;
}

// *********************************************
// ************* Matrix-vector *****************

float determinant(Matrix2x2 matrix)
{
    return matrix.a * matrix.d - matrix.b * matrix.c;
}

Vector2 matrixVecMultiply(Vector2 vec, Matrix2x2 matrix)
{
    return (Vector2){ vec.x * matrix.a + vec.y * matrix.c, vec.x * matrix.b + vec.y * matrix.d };
}

Matrix2x2 rotationMatrix(float angle)
{
    return (Matrix2x2){ cosf(angle), sinf(angle), -sinf(angle), cosf(angle) };
}

// ************************************************
// ****************** Object **********************

Vector2 calcCentroid(Object* obj)
{
    if (obj->type == OBJ_RECT)
    {
        RectObject* obj_R = (RectObject*)obj->typeObj;
        return vecAdd(obj->pos, vecScale((Vector2){obj_R->size.x, obj_R->size.y}, 0.5f));
    }
    else if (obj->type == OBJ_CIRCLE)
    {
        return obj->pos;
    }
}

// Uses Cramer's rule
Vector2 calcIntersection(Vector2 pos1, Vector2 vel1, Vector2 pos2, Vector2 vel2)
{
    
}