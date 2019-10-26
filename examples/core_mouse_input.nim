import nimraylib

const
  screenWidth = 800
  screenHeight = 450

initWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  ballPosition = Vector2( x: screenWidth / 2.0, y: screenHeight / 2.0)
  ballColor = DarkBlue


setTargetFPS(60)

while not windowShouldClose():
  ballPosition = getMousePosition()
  if isMouseButtonPressed(MOUSE_LEFT_BUTTON): ballColor = Maroon
  elif isMouseButtonPressed(MOUSE_MIDDLE_BUTTON): ballColor = DarkBlue
  elif isMouseButtonPressed(MOUSE_RIGHT_BUTTON): ballColor = Lime


  block draw:
    beginDrawing()
    defer: endDrawing()
    clearBackground(RayWhite)
    drawCircleV(ballPosition, 40, ballColor)
    drawText("move ball with mouse and click mouse button to change color", 10, 10, 20, Darkgray)

closeWindow()
