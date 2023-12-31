#include <raylib.h>
#include <stdbool.h>
#include <math.h>
#include "ballPhysics.h"

#include <stdio.h>

Collision circleAndRectCollision(Object* cObj, Object* rObj, ObjectType main);
Collision circleAndCircleCollision(Object* obj1, Object* obj2);
AABBox getAxisAlignedBBox(Object* obj);

// Calculates the trajectory of a vector during a frame during which a bounce occurs by considering
// the trajectories both before and after the bounce and the proportion of the frame time
// after which the collision occurs.
Vector2 calcCollisionVec(Vector2 vel1, Vector2 vel2, float collisionProp)
{
    return vecAdd(vecScale(vel1, collisionProp), vecScale(vel2, (1.0f - collisionProp)));
}

bool isFrameCollision(Collision* clsn)
{
    return clsn->prop >= 0.0f && clsn->prop < 1.0f;
}

bool isCollision(Collision* clsn)
{
    return clsn->prop >= 0.0f;
}

Collision findCollisions(ObjectList objects, int idx)
{
    int i;
    Object* obj = &objects.data[idx];
    Collision closestClsn = NO_CLSN, curClsn;

    if (obj->vel.x == 0.0f && obj->vel.y == 0.0f) return NO_CLSN;

    for (i = 0; i < objects.size; i++)
    {
        if (i == idx) continue;

        Object* obj2 = &objects.data[i];

        if (obj->type == OBJ_CIRCLE && obj2->type == OBJ_RECT)
            curClsn = circleAndRectCollision(obj, obj2, obj->type);
        else if (obj->type == OBJ_RECT && obj2->type == OBJ_CIRCLE)
            curClsn = circleAndRectCollision(obj2, obj, obj->type);
        else if (obj->type == OBJ_CIRCLE && obj2->type == OBJ_CIRCLE)
            curClsn = circleAndCircleCollision(obj, obj2);

        if (!isCollision(&closestClsn) || (isCollision(&curClsn) && curClsn.prop < closestClsn.prop))
            closestClsn = curClsn;
    }

    return closestClsn;
}

// Assumes rectangle is stationary, may be updated later
Collision circleAndRectCollision(Object* cObj, Object* rObj, ObjectType main)
{
    CircleObject* cObj_C = (CircleObject*)cObj->typeObj;
    RectObject* rObj_R = (RectObject*)rObj->typeObj;
    Vector2 dc = getFrameVel(cObj->vel), dr = getFrameVel(rObj->vel);

    Vector2 vertices[4]; // [bttm-left, bttm-right, top-right, top-left]
    int i;
    Vector2 intPos, slope, vert1, vert2;
    float clsnDistSq;

    getRectVertices(rObj, vertices);
    Vector2 rCenter = calcCentroid(rObj);

    // Determines which side of the rectangle the circle will collide with
    for (i = 0; i < 4; i++)
    {
        vert1 = vertices[i], vert2 = vertices[(i + 1) % 4];
        slope = vecSub(vert2, vert1);

        // The circle should be traveling in an opposing direction to the side's surface norm pointing opposite the rect center
        if (dotProduct((pointLineDiff(rCenter, slope, vert1)), dc) > 0.0f ||
            !isTravelingTowardsLine(cObj->pos, dc, vert1, slope)) continue;

        intPos = calcIntersection(cObj->pos, dc, vert1, slope);
        clsnDistSq = vecDistSquared((vecSub(cObj->pos, intPos)));

        Vector2 clsnPosOnLn, clsnPosOnVel, begProj;
        float clsnDistFromInt, prop;

        // ******** Uses similar triangles to calculate exact collision position *********
        begProj = vecAdd(cObj->pos, pointLineDiff(cObj->pos, slope, vert1));
        clsnDistFromInt = cObj_C->radius * 
                        (vecDist(vecSub(cObj->pos, intPos)) / vecDist(vecSub(cObj->pos, begProj)));

        clsnPosOnVel = vecSub(intPos, vecScale(vecNormalize(dc), clsnDistFromInt));
        clsnPosOnLn = vecAdd(clsnPosOnVel, pointLineDiff(clsnPosOnVel, slope, vert1));
        // *******************************************************************************

        if (clsnPosOnLn.x > MAX(vert1.x, vert2.x) || clsnPosOnLn.x < MIN(vert1.x, vert2.x) ||
            clsnPosOnLn.y > MAX(vert1.y, vert2.y) || clsnPosOnLn.y < MIN(vert1.y, vert2.y))
        {
            // The circle may still collide with a rectangle corner, which we will treat as
            // a collision with a static circle of radius zero

            Vector2 vert;
            float a, b, c, discriminant;

            vert = vecDistSquared(vecSub(vert1, cObj->pos)) < vecDistSquared(vecSub(vert2, cObj->pos)) ?
                vert1 : vert2;

            a = powf(dc.x, 2.0f) + powf(dc.y, 2.0f);

            b = 2.0f * dc.x * (cObj->pos.x - vert.x) +
                2.0f * dc.y * (cObj->pos.y - vert.y);

            c = powf(cObj->pos.x, 2.0f) + powf(vert.x, 2.0f) - (2.0f * cObj->pos.x * vert.x) +
                powf(cObj->pos.y, 2.0f) + powf(vert.y, 2.0f) - (2.0f * cObj->pos.y * vert.y) -
                powf(cObj_C->radius, 2.0f);

            discriminant = powf(b, 2.0f) - (4.0f * a * c); 
            if (discriminant < 0.0f) continue;

            prop = -(b + sqrtf(discriminant)) / (2.0f * a);
            slope = vecSub(calcMotionP(cObj->pos, dc, prop), vert);
        }
        else
        {
            prop = vecDist(vecSub(cObj->pos, clsnPosOnVel)) / vecDist(dc);
            slope = (Vector2){ -slope.y, slope.x };
        }

        return (Collision)
        {
            .prop = prop,
            .outVel = prop >= 1.0f ? VEC2_ZERO : vecReflect(cObj->vel, slope)
        };
    }

    return NO_CLSN;
}

Collision circleAndCircleCollision(Object* obj1, Object* obj2)
{
    CircleObject *obj1_C = (CircleObject*)obj1->typeObj, *obj2_C = (CircleObject*)obj2->typeObj;
    Vector2 d1 = getFrameVel(obj1->vel), d2 = getFrameVel(obj2->vel);
    Vector2 p1 = obj1->pos, p2 = obj2->pos;
    float r1 = obj1_C->radius, r2 = obj2_C->radius;

    float a, b, c, discriminant, prop, p;
    Vector2 pp1, pp2, n;

    // All calculations are derived from setting the distance formula equal to
    // 2 times the radius and expanding. The result is a quadratic in terms of time
    // (frame proportion) that can be solved using the quadratic formula. An explanation 
    // of the math will be on Github at some point.

    a = powf(d1.x, 2.0f) + powf(d2.x, 2.0f) - (2.0f * d1.x * d2.x) + 
        powf(d1.y, 2.0f) + powf(d2.y, 2.0f) - (2.0f * d1.y * d2.y);

    b = 2.0f * (p1.x * d1.x - p1.x * d2.x - p2.x * d1.x + p2.x * d2.x) + 
        2.0f * (p1.y * d1.y - p1.y * d2.y - p2.y * d1.y + p2.y * d2.y);

    c = powf(p1.x, 2.0f) + powf(p2.x, 2.0f) - (2.0f * p1.x * p2.x) + 
        powf(p1.y, 2.0f) + powf(p2.y, 2.0f) - (2.0f * p1.y * p2.y) - 
        powf(r1 + r2, 2.0f);

    discriminant = powf(b, 2.0f) - (4.0f * a * c);
    if (discriminant < 0.0f) return NO_CLSN;

    prop = -(b + sqrtf(discriminant)) / (2.0f * a);
    //if (prop >= 1.0f) return NO_CLSN;

    if (prop < 1.0f)
    {
        // Determining the collision angle

        pp1 = calcMotionP(p1, d1, prop);
        pp2 = calcMotionP(p2, d2, prop);

        n = vecScale(vecSub(pp2, pp1), 1.0f / (r1 + r2));
        p = dotProduct(n, vecSub(obj1->vel, obj2->vel));
    }

    return (Collision)
    { 
        .prop = prop,
        .outVel = prop >= 1.0f ? VEC2_ZERO : vecSub(obj1->vel, vecScale(n, p))
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