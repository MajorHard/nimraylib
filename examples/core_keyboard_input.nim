import nimraylib

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - keyboard input")

var ballPosition = Vector2( x: screenWidth / 2.0, y: screenHeight / 2.0)

SetTargetFPS(60)

while not WindowShouldClose():
  if IsKeyDown(KEY_RIGHT): ballPosition.x += 2.0
  if IsKeyDown(KEY_LEFT): ballPosition.x -= 2.0
  if IsKeyDown(KEY_UP): ballPosition.y -= 2.0
  if IsKeyDown(KEY_DOWN): ballPosition.y += 2.0

  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)
    DrawText("move the ball with arrow keys", 10, 10, 20, Darkgray)
    DrawCircleV(ballPosition, 50, Maroon)

CloseWindow()
