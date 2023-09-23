#include <raylib.h>
#include "ball_physics.h"

void handleSpeedMod(double* speedMod)
{
    if (GetKeyPressed() == KEY_UP)
        *speedMod += 1.0;
    else if (GetKeyPressed() == KEY_DOWN && *speedMod >= 1.0)
        *speedMod -= 1.0;
}