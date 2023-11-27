// THIS FILE IS USED FOR TESTING
AABBox getAxisAlignedBBox(Object* obj);

int main()
{
    float radius = 9.0f;
    Vector2 pos = { 141.4, 454.7 };
    Vector2 dc = { -50, -690 };
    Vector2 vert = { 134, 250.5 };

    float a = powf(dc.x, 2.0f) + powf(dc.y, 2.0f);

    float b = 2.0f * dc.x * (pos.x - vert.x) +
        2.0f * dc.y * (pos.y - vert.y);

    float c = powf(pos.x, 2.0f) + powf(vert.x, 2.0f) - (2.0f * pos.x * vert.x) +
        powf(pos.y, 2.0f) + powf(vert.y, 2.0f) - (2.0f * pos.y * vert.y) -
        powf(radius, 2.0f);

    float discriminant = powf(b, 2.0f) - (4.0f * a * c); 
    float t = -(b + sqrtf(discriminant)) / (2.0f * a);

    printf("t: %f, a: %f, b: %f, c: %f\n", t, a, b, c);
    return 0;

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
