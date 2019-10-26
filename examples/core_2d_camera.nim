import nimraylib
import sequtils

const
  screenWidth = 800
  screenHeight = 450
  maxBuildings = 100

initWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  player = Rectangle(x: 400, y: 280, width: 40, height: 40)
  spacing = 0
  buildings = newSeq[Rectangle](maxBuildings)
  buildingColors = newSeq[Color](maxBuildings)
    .map(proc (color: Color): Color =
      result = color
      result.r = getRandomValue(200, 240).char
      result.g = getRandomValue(200, 240).char
      result.b = getRandomValue(200, 250).char
      result.a = 255.char
    )
  camera = Camera2D()

for i in 0..<buildings.len:
  buildings[i].width = getRandomValue(50, 200).cfloat
  buildings[i].height = getRandomValue(100, 800).cfloat
  buildings[i].y = screenHeight - 130 - buildings[i].height
  buildings[i].x = (-6000 + spacing).cfloat
  spacing += buildings[i].width.int

camera.target = Vector2(x: player.x + 20, y: player.y + 20)
camera.offset = Vector2(x: screenWidth / 2, y: screenHeight / 2)
camera.rotation = 0'f32
camera.zoom = 1'f32

proc reset(camera: var Camera2D) =
  camera.zoom = 1
  camera.rotation = 0


setTargetFPS(60)

while not windowShouldClose():
  if isKeyDown(KEY_RIGHT): player.x += 2
  elif isKeyDown(KEY_LEFT): player.x -= 2

  camera.target = Vector2(x: player.x + 20, y: player.y + 20)

  if isKeyDown(KEY_A): camera.rotation += 1
  elif isKeyDown(KEY_S): camera.rotation -= 1

  camera.zoom = (camera.zoom + getMouseWheelMove().float32*0.05)
    .clamp(0.1, 3)


  if isKeyDown(KEY_R): camera.reset()


  block draw:
    beginDrawing()
    defer: endDrawing()
    clearBackground(RayWhite)

    block draw2d:
      beginMode2D(camera)
      defer: endMode2D()

      drawRectangle(-6000, 320, 13000, 8000, DarkGray)
      for i in 0..<maxBuildings: drawRectangleRec(buildings[i], buildingColors[i])
      drawRectangleRec(player, Red)

      drawLine(camera.target.x.int32, -screenHeight*10, camera.target.x.int32, screenHeight*10, Green)
      drawLine(-screenWidth*10, camera.target.y.int32, screenWidth*10, camera.target.y.int32 , Green)

    drawText("SCREEN AREA", 640, 10, 20, Red)

    drawRectangle(0, 0, screenWidth, 5, RED)
    drawRectangle(0, 5, 5, screenHeight - 10, RED)
    drawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, RED)
    drawRectangle(0, screenHeight - 5, screenWidth, 5, RED)

    drawRectangle(10, 10, 250, 113, Skyblue.Fade(0.5))
    drawRectangleLines(10, 10, 250, 113, Blue)

    drawText("Free 2D Camera Controls:", 20, 20, 10, Black)
    drawText("- Right/Left to move Offset", 40, 40, 10, DarkGray)
    drawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, DarkGray)
    drawText("- A / S to Rotate", 40, 80, 10, DarkGray)
    drawText("- R to reset Zoom and Rotation", 40, 100, 10, DarkGray)

closeWindow()
