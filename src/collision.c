#include <raylib.h>
#include <stdbool.h>
#include <math.h>
#include "ballPhysics.h"

#include <stdio.h>

Collision circleAndRectCollision(Object* cObj, Object* rObj);
Collision circleAndCircleCollision(Object* obj1, Object* obj2);
AABBox getAxisAlignedBBox(Object* obj);

// Condensed bounce vector calculations using the method proposed
// at this link: https://stackoverflow.com/questions/573084/how-to-calculate-bounce-angle
Vector2 calcBounceVec(Vector2 vel, float surfaceAngle)
{
    Vector2 n = { cosf(surfaceAngle), sinf(surfaceAngle) };

    Vector2 projVec = vecProj(n, vel);
    Vector2 perpVec = pointLineDiff(vel, n, VEC2_ZERO);

    return vecAdd(projVec, perpVec);
}

// Calculates the trajectory of a vector during a frame during which a bounce occurs by considering
// the trajectories both before and after the bounce and the proportion of the frame time
// after which the collision occurs.
Vector2 calcCollisionVec(Vector2 vel1, Vector2 vel2, float collisionProp)
{
    return vecAdd(vecScale(vel1, collisionProp), vecScale(vel2, (1.0f - collisionProp)));
}

bool isCollision(Collision clsn)
{
    return clsn.prop >= 0.0f;
}

Collision findCollisions(ObjectList objects, int idx)
{
    int i;
    Object* obj = &objects.data[idx];
    Collision clsn;

    for (i = 0; i < objects.size; i++)
    {
        if (i == idx) continue;

        Object* obj2 = &objects.data[i];

        if (obj->type == OBJ_CIRCLE && obj2->type == OBJ_RECT)
            clsn = circleAndRectCollision(obj, obj2);
        else if (obj->type == OBJ_RECT && obj2->type == OBJ_CIRCLE)
            clsn = circleAndRectCollision(obj2, obj);
        else
            clsn = circleAndCircleCollision(obj, obj2);

        if (clsn.prop < 0.0f) continue;

        return clsn;
    }

    return NO_CLSN;
}

// TODO - Assumes rectangle is stationary; fix
Collision circleAndRectCollision(Object* cObj, Object* rObj)
{
    CircleObject* cObj_C = (CircleObject*)cObj->typeObj;
    RectObject* rObj_R = (RectObject*)rObj->typeObj;
    Vector2 dc = getFrameVel(cObj->vel), dr = getFrameVel(rObj->vel);

    Vector2 vertices[4]; // [bttm-left, bttm-right, top-right, top-left]
    int i;
    Vector2 clsnPos, curClsnPos, slope, curSlope, vert1, vert2;
    float clsnDist = INFINITY, curClsnDist, begDist, prop;

    getRectVertices(rObj, vertices);

    // TODO - Minimize intersection calulations by adding a multi-phase check
    for (i = 0; i < 4; i++)
    {
        curSlope = (Vector2){ vertices[(i + 1) % 4].x - vertices[i].x, vertices[(i + 1) % 4].y - vertices[i].y };
        curClsnPos = calcIntersection(cObj->pos, dc, vertices[i], curSlope);
        curClsnDist = vecDist((vecSub(cObj->pos, curClsnPos)));

        if (curClsnDist < clsnDist)
            clsnPos = curClsnPos, clsnDist = curClsnDist, slope = curSlope, 
            vert1 = vertices[i], vert2 = vertices[(i + 1) % 4];
    }

    if (looseFloatGt(clsnPos.x, MAX(vert1.x, vert2.x)) || looseFloatLt(clsnPos.x, MIN(vert1.x, vert2.x)) ||
        looseFloatGt(clsnPos.y, MAX(vert1.y, vert2.y)) || looseFloatLt(clsnPos.y, MIN(vert1.y, vert2.y)))
            return NO_CLSN;

    begDist = vecDist(pointLineDiff(cObj->pos, slope, vert1));
    prop = (begDist - cObj_C->radius) / begDist;
    
    if (clsnDist * prop >= vecDist(dc)) return NO_CLSN;

    printf("Vert1: <%f, %f>\n", vert1.x, vert1.y);
    printf("Vert2: <%f, %f>\n", vert2.x, vert2.y);
    printf("ClsnPos: <%f, %f>\n", clsnPos.x, clsnPos.y);

    return (Collision)
    {
        .prop = prop,
        .tanAngle = atan2f(slope.y, slope.x)
    };
}

// Assumes balls have same radius -- edit later
Collision circleAndCircleCollision(Object* obj1, Object* obj2)
{
    CircleObject *obj1_C = (CircleObject*)obj1->typeObj, *obj2_C = (CircleObject*)obj2->typeObj;
    Vector2 d1 = getFrameVel(obj1->vel), d2 = getFrameVel(obj2->vel);
    Vector2 p1 = obj1->pos, p2 = obj2->pos;
    float r1 = obj1_C->radius, r2 = obj2_C->radius;

    float a, b, c, discriminant, prop;
    Vector2 pp1, pp2, cDiff;

    // All calculations are derived from setting the distance formula equal to
    // 2 times the radius and expanding. The result is a quadratic in terms of time
    // (frame proportion) that can be solved using the quadratic formula. An explanation 
    // of the math will be on Github at some point.

    a = (d1.x * d1.x) + (d2.x * d2.x) - (2.0f * d1.x * d2.x) + 
        (d1.y * d1.y) + (d2.y * d2.y) - (2.0f * d1.y * d2.y);

    b = 2.0f * (p1.x * d1.x - p1.x * d2.x - p2.x * d1.x + p2.x * d2.x) + 
        2.0f * (p1.y * d1.y - p1.y * d2.y - p2.y * d1.y + p2.y * d2.y);

    c = (p1.x * p1.x) + (p2.x * p2.x) - (2.0f * p1.x * p2.x) + 
        (p1.y * p1.y) + (p2.y * p2.y) - (2.0f * p1.y * p2.y) - 
        (r1 + r2) * (r1 + r2);

    discriminant = (b * b) - (4.0f * a * c);

    if (discriminant < 0.0f) return NO_CLSN;

    prop = -(b + sqrtf(discriminant)) / (2.0f * a);

    if (prop > 1.0f) return NO_CLSN;

    // Determining the collision angle

    pp1 = calcMotionP(p1, d1, prop);
    pp2 = calcMotionP(p2, d2, prop);
    cDiff = vecSub(pp2, pp1);

    return (Collision)
    { 
        .prop = prop,
        .tanAngle = atan2f(-cDiff.x, cDiff.y) // Gets perpendicular (tan) angle to diff angle
    };
}

AABBox getAxisAlignedBBox(Object* obj)
{
    if (obj->type == OBJ_CIRCLE)
    {
        CircleObject* obj_C = (CircleObject*)obj->typeObj;

        return (AABBox)
        {   
            .pos = (Vector2){ obj->pos.x - obj_C->radius, obj->pos.y - obj_C->radius },
            .size = (Vector2){ obj_C->radius, obj_C->radius }
        };
    }
    else if (obj->type == OBJ_RECT)
    {
        RectObject* obj_R = (RectObject*)obj->typeObj;

        Vector2 pos = { INFINITY, INFINITY }, size = { -INFINITY, -INFINITY };
        int i;

        Vector2 vertices[4];
        getRectVertices(obj, vertices);

        for (i = 0; i < 4; i++)
        {
            pos.x = MIN(pos.x, vertices[i].x);
            pos.y = MIN(pos.y, vertices[i].y);
            size.x = MAX(size.x, vertices[i].x);
            size.y = MAX(size.y, vertices[i].y);
        }        
        size = vecSub(size, pos);

        return (AABBox) { pos, size };
    }

    return (AABBox){ VEC2_ZERO, VEC2_ZERO };
}