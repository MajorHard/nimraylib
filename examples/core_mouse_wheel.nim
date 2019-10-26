import nimraylib
import strformat

const
  screenWidth = 800
  screenHeight = 450

initWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  boxPositionY = (screenHeight / 2).int32 - 40'i32
  scrollSpeed  = 10'i32


setTargetFPS(60)

while not windowShouldClose():
  boxPositionY -= (getMouseWheelMove() * scrollSpeed).int32

  block draw:
    beginDrawing()
    defer: endDrawing()

    clearBackground(RayWhite)

    drawRectangle((screenWidth / 2'i32).int32 - 40'i32, boxPositionY, 80, 80, Maroon)
    drawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, Gray)
    drawText(fmt"Box position Y: {screenWidth / 2}", 10, 40, 20, Darkgray)

closeWindow()
