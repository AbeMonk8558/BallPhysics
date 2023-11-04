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

float vecDistSquared(Vector2 vec)
{
    return vec.x * vec.x + vec.y * vec.y;
}

Vector2 vecInverse(Vector2 vec)
{
    return (Vector2){-vec.x, -vec.y};
}

float dotProduct(Vector2 left, Vector2 right)
{
    return left.x * right.x + left.y * right.y;
}

Vector2 vecNormalize(Vector2 vec)
{
    float dist = vecDist(vec);
    return (Vector2){ vec.x / dist, vec.y / dist };
}

// Gets the projected vector onto a surface.
Vector2 vecProj(Vector2 surface, Vector2 vec)
{
    Vector2 n = vecNormalize(surface);
    return vecScale(n, dotProduct(n, vec));
}

// Gets the vector difference from a point to the closest point on a line (pointing towards the line).
Vector2 pointLineDiff(Vector2 point, Vector2 lineSlope, Vector2 linePos)
{
    // Derives from the relationship linePos + (lambda)lineSlope = linePoint solved
    // for lambda using the relationship (linePoint - point) * lineSlope = 0 where "*"
    // is the dot product. This is true b/c the * of perpendicular vectors is always 0.
    float lambda = dotProduct(vecSub(point, linePos), lineSlope) / vecDistSquared(lineSlope);
    Vector2 linePoint = vecAdd(linePos, vecScale(lineSlope, lambda));

    return vecSub(linePoint, point);
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

Matrix2x2 matrixFromVectors(Vector2 xVec, Vector2 yVec)
{
    return (Matrix2x2){ xVec.x, xVec.y, yVec.x, yVec.y };
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

// Gets vertices of rectangle in order [bttm-left, bttm-right, top-right, top-left]
Vector2 getRectVertices(Object* rObj, Vector2 vertices[4])
{
    RectObject* rObj_R = (RectObject*)rObj->typeObj;

    float w = rObj_R->size.x, h = rObj_R->size.y, r = rObj_R->rotation;
    Vector2 c = calcCentroid(rObj);
    Matrix2x2 rMatrix = rotationMatrix(r);

    vertices[0] = vecAdd(c, matrixVecMultiply(vecSub(rObj->pos, c), rMatrix));
    vertices[1] = vecAdd(c, matrixVecMultiply(vecSub((Vector2){ rObj->pos.x + w, rObj->pos.y }, c), rMatrix));
    vertices[2] = vecAdd(c, matrixVecMultiply(vecSub((Vector2){ rObj->pos.x + w, rObj->pos.y + h }, c), rMatrix));
    vertices[3] = vecAdd(c, matrixVecMultiply(vecSub((Vector2){ rObj->pos.x, rObj->pos.y + h }, c), rMatrix));
}

// Uses Cramer's rule
Vector2 calcIntersection(Vector2 pos1, Vector2 vel1, Vector2 pos2, Vector2 vel2)
{
    // Uses stupid-ass method of transforming basis by arbitrary angle to avoid undefined lines. Will
    // probably edit later, but for now I'm proud of myself for actually understanding linear algebra.

    static arbitraryAngle = 7.8989898;

    Matrix2x2 rMatrix = rotationMatrix(arbitraryAngle);
    pos1 = matrixVecMultiply(pos1, rMatrix);
    vel1 = matrixVecMultiply(vel1, rMatrix);
    pos2 = matrixVecMultiply(pos2, rMatrix);
    vel2 = matrixVecMultiply(vel2, rMatrix);

    float yInt1 = pos1.y - vel1.y / vel1.x * pos1.x,
          yInt2 = pos2.y - vel2.y / vel2.x * pos2.x;

    float dm = determinant((Matrix2x2){ 1, 1, -vel1.y / vel1.x, -vel2.y / vel2.x });
    float dx = determinant((Matrix2x2){ yInt1, yInt2, 1, 1 });
    float dy = determinant((Matrix2x2){ -vel1.y / vel1.x, -vel2.y / vel2.x, yInt1, yInt2 });

    return matrixVecMultiply(vecInverse((Vector2){ dx / dm, dy / dm }), rotationMatrix(-arbitraryAngle));
}

// ********************************************************************
// ************************ Kinematics ********************************

Vector2 calcMotion(Vector2 pos, Vector2 vel)
{
    // Could get more complex later on with mass and acceleration, so this is pre-empting that.
    return vecAdd(pos, vel);
}

Vector2 calcMotionP(Vector2 pos, Vector2 vel, float prop)
{
    return vecAdd(pos, vecScale(vel, prop));
}

// ********************************************************************