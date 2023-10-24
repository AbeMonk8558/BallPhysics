// THIS FILE IS USED FOR TESTING
AABBox getAxisAlignedBBox(Object* obj);

int main()
{
    Vector2 i = calcIntersection((Vector2){ 7, 8 }, (Vector2){ 1, 9 }, (Vector2){ -100, 50 }, (Vector2){ 5, 1 });
    printf("(%f, %f)\n", i.x, i.y);

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

    AABBox b = getAxisAlignedBBox(&objects.data[1]);
    Vector2 bPos = getRenderPos((Vector2){ b.pos.x, b.pos.y + b.size.y });
    printf("{ Pos = { %f, %f }, Size = { %f, %f } }\n", b.pos.x, b.pos.y, b.size.x, b.size.y);

    DrawRectanglePro(
        (Rectangle){ bPos.x, bPos.y, b.size.x, b.size.y },
        VEC2_ZERO,
        0.0f,
        (Color){ 255, 0, 0, 100 }
    );

    renderObjects();
    EndDrawing();

    WaitTime(20);

    CloseWindow();
    return 0;
}
