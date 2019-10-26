import nimraylib
import sequtils

const
  screenWidth = 800
  screenHeight = 450
  maxBuildings = 100

InitWindow(screenWidth, screenHeight, "raylib [core] examples - mouse input")

var
  player = Rectangle(x: 400, y: 280, width: 40, height: 40)
  spacing = 0
  buildings = newSeq[Rectangle](maxBuildings)
  buildingColors = newSeq[Color](maxBuildings)
    .map(proc (color: Color): Color =
      result = color
      result.r = GetRandomValue(200, 240).char
      result.g = GetRandomValue(200, 240).char
      result.b = GetRandomValue(200, 250).char
      result.a = 255.char
    )
  camera = Camera2D()

for i in 0..<buildings.len:
  buildings[i].width = GetRandomValue(50, 200).cfloat
  buildings[i].height = GetRandomValue(100, 800).cfloat
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


SetTargetFPS(60)

while not WindowShouldClose():
  if IsKeyDown(KEY_RIGHT): player.x += 2
  elif IsKeyDown(KEY_LEFT): player.x -= 2

  camera.target = Vector2(x: player.x + 20, y: player.y + 20)

  if IsKeyDown(KEY_A): camera.rotation += 1
  elif IsKeyDown(KEY_S): camera.rotation -= 1

  camera.zoom = (camera.zoom + GetMouseWheelMove().float32*0.05)
    .clamp(0.1, 3)


  if IsKeyDown(KEY_R): camera.reset()


  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)

    block draw2d:
      BeginMode2D(camera)
      defer: EndMode2D()

      DrawRectangle(-6000, 320, 13000, 8000, DarkGray)
      for i in 0..<maxBuildings: DrawRectangleRec(buildings[i], buildingColors[i])
      DrawRectangleRec(player, Red)

      DrawLine(camera.target.x.int32, -screenHeight*10, camera.target.x.int32, screenHeight*10, Green)
      DrawLine(-screenWidth*10, camera.target.y.int32, screenWidth*10, camera.target.y.int32 , Green)

    DrawText("SCREEN AREA", 640, 10, 20, Red)

    DrawRectangle(0, 0, screenWidth, 5, RED)
    DrawRectangle(0, 5, 5, screenHeight - 10, RED)
    DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, RED)
    DrawRectangle(0, screenHeight - 5, screenWidth, 5, RED)

    DrawRectangle(10, 10, 250, 113, Fade(Skyblue, 0.5))
    DrawRectangleLines(10, 10, 250, 113, Blue)

    DrawText("Free 2D Camera Controls:", 20, 20, 10, Black)
    DrawText("- Right/Left to move Offset", 40, 40, 10, DarkGray)
    DrawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, DarkGray)
    DrawText("- A / S to Rotate", 40, 80, 10, DarkGray)
    DrawText("- R to reset Zoom and Rotation", 40, 100, 10, DarkGray)



CloseWindow()
