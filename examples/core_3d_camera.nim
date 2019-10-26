import nimraylib

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - 3d camera mode")

var
  camera = Camera3D(
    position: Vector3(x: 0, y: 10, z: 10),
    target:   Vector3(x: 0, y: 0,  z: 0),
    up:       Vector3(x: 0, y: 1,  z: 0),
    fovy:     45'f32,
    `type`: CAMERA_PERSPECTIVE
  )

  cubePosition = Vector3(x: 0, y: 0, z: 0)

while not WindowShouldClose():
  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)

    block draw3d:
      BeginMode3D(camera)
      defer: EndMode3D()

      DrawCube(cubePosition, 2, 2, 2, Red)
      DrawCubeWires(cubePosition, 2, 2, 2, Maroon)
      DrawGrid(10, 1)

    DrawText("Welcome to the thrid dimension!", 10, 40, 20, DarkGray)
    DrawFPS(10, 10)

CloseWindow()
