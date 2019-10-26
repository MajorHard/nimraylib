import nimraylib

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - keyboard input")

var ballPosition = Vector2( x: screenWidth / 2.0, y: screenHeight / 2.0)

SetTargetFPS(60)

while not WindowShouldClose():
  if IsKeyDown(KEY_RIGHT.to_cint()): ballPosition.x += 2.0
  if IsKeyDown(KEY_LEFT.to_cint()): ballPosition.x -= 2.0
  if IsKeyDown(KEY_UP.to_cint()): ballPosition.y -= 2.0
  if IsKeyDown(KEY_DOWN.to_cint()): ballPosition.y += 2.0

  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)
    DrawText("move the ball with arrow keys", 10, 10, 20, Darkgray)
    DrawCircleV(ballPosition, 50, Maroon)

CloseWindow()
