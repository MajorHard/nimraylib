import nimraylib

const
  screenWidth = 800
  screenHeight = 450

InitWindow(screenWidth, screenHeight, "raylib [core] examples - 3d picking")

var
  ray: Ray
  collision = false
  cubePosition = Vector3(x: 0, y: 1, z: 0)
  cubeSize = Vector3(x: 2, y: 2, z: 2)
  camera = Camera3D(
    position: Vector3(x: 10, y: 10, z: 10),
    target:   Vector3(x: 0,  y: 0,  z: 0),
    up:       Vector3(x: 0,  y: 1,  z: 0),
    fovy:     45'f32,
    `type`: CAMERA_PERSPECTIVE
  )

camera.SetCameraMode(CAMERA_FREE)
SetTargetFPS(60)


while not WindowShouldClose():
  UpdateCamera(addr camera)

  if IsMouseButtonPressed(MOUSE_LEFT_BUTTON):
    if collision:
      collision = false
    else:
      var boundingBox = BoundingBox(
        min: Vector3(
          x: cubePosition.x - cubeSize.x / 2,
          y: cubePosition.y - cubeSize.y / 2,
          z: cubePosition.z - cubeSize.z / 2
        ),
        max: Vector3(
          x: cubePosition.x + cubeSize.x / 2,
          y: cubePosition.y + cubeSize.y / 2,
          z: cubePosition.z + cubeSize.z / 2
        ))
      ray = GetMouseRay(GetMousePosition(), camera)
      collision = ray.CheckCollisionRayBox(boundingBox)

  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)

    block draw3d:
      BeginMode3D(camera)
      defer: EndMode3D()

      if collision:
        cubePosition.DrawCube(cubeSize.x, cubeSize.y, cubeSize.z, Red)
        cubePosition.DrawCubeWires(cubeSize.x, cubeSize.y, cubeSize.z, Maroon)
        cubePosition.DrawCubeWires(cubeSize.x + 0.2, cubeSize.y + 0.2, cubeSize.z + 0.2, Green)
      else:
        cubePosition.DrawCube(cubeSize.x, cubeSize.y, cubeSize.z, Gray)
        cubePosition.DrawCubeWires(cubeSize.x, cubeSize.y, cubeSize.z, DarkGray)

      DrawGrid(10, 1)

    DrawText("Try selecting the box with mouse!", 240, 10, 20, DarkGray)

    if collision:
      var posX = (screenWidth - MeasureText("BOX SELECTED", 30)) / 2
      DrawText("BOX SELECTED", posX.int32, (screenHeight * 0.2).int32, 30, Green)

    DrawText("Welcome to the thrid dimension!", 10, 40, 20, DarkGray)
    DrawFPS(10, 10)

CloseWindow()
