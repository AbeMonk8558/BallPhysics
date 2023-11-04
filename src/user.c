#include <raylib.h>
#include <raygui.h>
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

    if (IsMouseButtonPressed(lineBtn))
    {
        currLnStart = mousePos;
        DrawLineV(mousePos, mousePos, WHITE);
    }
    else if (IsMouseButtonDown(lineBtn))
    {
        DrawLineV(currLnStart, mousePos, WHITE);
    }
    else if (IsMouseButtonReleased(lineBtn))
    {
        Vector2 m = getStandardPos(mousePos);
        Vector2 c = getStandardPos(currLnStart);

        printf("m: (%f, %f)\n", m.x, m.y);
        printf("c: (%f, %f)\n", c.x, c.y);

        addRectObject(m, VEC2_ZERO, (Vector2){ 1, c.y - m.y }, 0.0f);
    }
}