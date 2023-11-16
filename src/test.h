// THIS FILE IS USED FOR TESTING
AABBox getAxisAlignedBBox(Object* obj);

int main()
{
    targetFPS = DEF_TARGET_FPS;
    speedMod = 1.0f;

    objects.capacity = 1;
    objects.data = (Object*)malloc(objects.capacity * sizeof(Object));
    objects.size = 0;

    collisions = (Collision*)malloc(objects.capacity * sizeof(Collision));

    addRectObject((Vector2){ 250, 250 }, VEC2_ZERO, (Vector2){ 50, 100 }, 0.0f);
    addRectObject((Vector2){ 250, 250 }, VEC2_ZERO, (Vector2){ 50, 100 }, PI / 4);

    SetTraceLogLevel(LOG_FATAL);
    InitWindow(500, 500, "Test");

    BeginDrawing();
    renderObjects();
    DrawCircleV(getRenderPos(calcCentroid(&objects.data[1])), 2.0f, ORANGE);
    EndDrawing();

    WaitTime(20);

    CloseWindow();
    return 0;
}
