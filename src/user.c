#include <raylib.h>
#include <raygui.h>
#include <math.h>
#include "ballPhysics.h"

#include <stdio.h>

// void configureUI(void)
// {
    
// }

void handleSpeedMod(float* speedMod, KeyboardKey key)
{
    if (key == KEY_UP)
        *speedMod += 1.0;
    else if (key == KEY_DOWN && *speedMod >= 2.0)
        *speedMod -= 1.0;
}

void handlePause(bool* paused, KeyboardKey key)
{
    if (key == KEY_P)
        *paused = !(*paused);
}

void handleLineCreation(Vector2 mousePos)
{
    MouseButton lineBtn = MOUSE_BUTTON_LEFT;
    static Vector2 currLnStart;
    static float currRotation;

    if (IsMouseButtonPressed(lineBtn))
    {
        currLnStart = mousePos;
        currRotation = 0.0f;
        DrawPixelV(mousePos, WHITE);
    }
    else if (IsMouseButtonDown(lineBtn))
    {
        if (IsKeyPressed(KEY_LEFT)) currRotation -= PI / 6.0f;
        if (IsKeyPressed(KEY_RIGHT)) currRotation += PI / 6.0f;

        int i;
        Vector2 vertices[4];
        Vector2 m = getStandardPos(mousePos), c = getStandardPos(currLnStart);

        getRectVerticesVerbose((Vector2){ MIN(c.x, m.x), MIN(c.y, m.y) }, 
            (Vector2){ fabsf(m.x - c.x), fabsf(m.y - c.y) }, currRotation, vertices);

        for (i = 0; i < 4; i++)
            DrawLineV(getRenderPos(vertices[i]), getRenderPos(vertices[(i + 1) % 4]), WHITE);
    }
    else if (IsMouseButtonReleased(lineBtn))
    {
        Vector2 m = getStandardPos(mousePos);
        Vector2 c = getStandardPos(currLnStart);

        addRectObject((Vector2){ MIN(c.x, m.x), MIN(c.y, m.y) }, VEC2_ZERO, 
            (Vector2){ fabsf(m.x - c.x), fabsf(m.y - c.y) }, currRotation);
    }
}