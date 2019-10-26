import nimraylib
import strformat

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  boxPositionY = (screenHeight / 2).int32 - 40'i32
  scrollSpeed  = 10'i32


SetTargetFPS(60)

while not WindowShouldClose():
  boxPositionY -= (GetMouseWheelMove() * scrollSpeed).int32

  block draw:
    BeginDrawing()
    defer: EndDrawing()

    ClearBackground(RayWhite)

    DrawRectangle((screenWidth / 2'i32).int32 - 40'i32, boxPositionY, 80, 80, Maroon)
    DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, Gray)
    DrawText(fmt"Box position Y: {screenWidth / 2}", 10, 40, 20, Darkgray)

CloseWindow()
