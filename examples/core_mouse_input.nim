import nimraylib

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  ballPosition = Vector2( x: screenWidth / 2.0, y: screenHeight / 2.0)
  ballColor = DarkBlue


SetTargetFPS(60)

while not WindowShouldClose():
  ballPosition = GetMousePosition()
  if IsMouseButtonPressed(MOUSE_LEFT_BUTTON): ballColor = Maroon
  elif IsMouseButtonPressed(MOUSE_MIDDLE_BUTTON): ballColor = DarkBlue
  elif IsMouseButtonPressed(MOUSE_RIGHT_BUTTON): ballColor = Lime


  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)
    DrawCircleV(ballPosition, 40, ballColor)
    DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, Darkgray)

CloseWindow()
