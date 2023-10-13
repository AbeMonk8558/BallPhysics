#include <raylib.h>
#include "ballPhysics.h"

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