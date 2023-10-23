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

    Vector2 nProj = vecScale(n, dotProduct(vel, n)), perpDist = vecSub(vel, nProj);

    return vecInverse(vecSub(perpDist, nProj));
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

    Vector2 vertices[4]; // [bttm-left, bttm-right, top-right, top-left]
    int i;

    Vector2 clsnPos, intersection, slope;
    float clsnDist = INFINITY, intersectionDist;

    getRectVertices(rObj, vertices);

    // TODO - Minimize intersection calulations by adding a multi-phase check
    for (i = 0; i < 4; i++)
    {
        slope = (Vector2){ vertices[(i + 1) % 4].y - vertices[i].y, vertices[(i + 1) % 4].x - vertices[i].x};
        intersection = calcIntersection(cObj->pos, cObj->vel, vertices[i], slope);
        intersectionDist = vecDist((vecSub(cObj->pos, intersection)));

        if (intersectionDist < clsnDist)
            clsnPos = intersection, clsnDist = intersectionDist;
    }

    if (clsnDist <= vecDist(cObj->vel)) return NO_CLSN;

    // TODO - Complete
}

// Assumes balls have same radius -- edit later
Collision circleAndCircleCollision(Object* obj1, Object* obj2)
{
    CircleObject *obj1_C = (CircleObject*)obj1->typeObj, *obj2_C = (CircleObject*)obj2->typeObj;
    Vector2 d1 = getFrameVel(obj1->vel), d2 = getFrameVel(obj2->vel);

    float begDist = vecDist(vecSub(obj1->pos, obj2->pos)), 
          endDist = vecDist(vecSub(vecAdd(obj1->pos, d1), vecAdd(obj2->pos, d2)));

    if (endDist >= begDist || endDist >= obj1_C->radius * 2.0f) 
        return NO_CLSN;

    return (Collision)
    { 
        .prop = (begDist - obj1_C->radius * 2.0f) / (begDist - endDist), 
        .tanAngle = atan2f(d1.y + d2.y, d1.x + d2.x) 
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
}