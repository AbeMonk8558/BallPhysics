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

Collision circleAndRectCollision(Object* cObj, Object* rObj)
{
    CircleObject* cObj_C = (CircleObject*)cObj->typeObj;
    RectObject* rObj_R = (RectObject*)rObj->typeObj;

    

    return NO_CLSN;
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

        // TODO - Maybe make this more elegant later.
        Vector2 c = calcCentroid(obj);
        float cDist = vecDist((Vector2){ obj_R->size.x, obj_R->size.y }) / 2.0f;
        float r = obj_R->rotation;

        Vector2 pos, size;

        if (r >= 0 && r < PI / 2)
        {
            // x2 = x0+(x-x0)*cos(theta)+(y-y0)*sin(theta)
            // y2 = y0-(x-x0)*sin(theta)+(y-y0)*cos(theta)
            pos = vecAdd(c, vecScale((Vector2){ cosf(2 * PI / 3 + r), sinf(2 * PI / 3 + r) }, cDist));

        }

        return (AABBox) { pos, size };
    }
}