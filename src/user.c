#include <raylib.h>
#include <raygui.h>
#include "ballPhysics.h"

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
}