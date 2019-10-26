import nimraylib

const
  screenWidth = 800
  screenHeight = 450

initWindow(screenWidth, screenHeight, "raylib [core] examples - 3d picking")

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
setTargetFPS(60)


while not windowShouldClose():
  updateCamera(addr camera)

  if isMouseButtonPressed(MOUSE_LEFT_BUTTON):
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
      ray = getMouseRay(getMousePosition(), camera)
      collision = ray.CheckCollisionRayBox(boundingBox)

  block draw:
    beginDrawing()
    defer: endDrawing()
    clearBackground(RayWhite)

    block draw3d:
      beginMode3D(camera)
      defer: endMode3D()

      if collision:
        cubePosition.DrawCube(cubeSize.x, cubeSize.y, cubeSize.z, Red)
        cubePosition.DrawCubeWires(cubeSize.x, cubeSize.y, cubeSize.z, Maroon)
        cubePosition.DrawCubeWires(cubeSize.x + 0.2, cubeSize.y + 0.2, cubeSize.z + 0.2, Green)
      else:
        cubePosition.DrawCube(cubeSize.x, cubeSize.y, cubeSize.z, Gray)
        cubePosition.DrawCubeWires(cubeSize.x, cubeSize.y, cubeSize.z, DarkGray)

      drawGrid(10, 1)

    drawText("Try selecting the box with mouse!", 240, 10, 20, DarkGray)

    if collision:
      var posX = (screenWidth - measureText("BOX SELECTED", 30)) / 2
      drawText("BOX SELECTED", posX.int32, (screenHeight * 0.2).int32, 30, Green)

    drawText("Welcome to the thrid dimension!", 10, 40, 20, DarkGray)
    drawFPS(10, 10)

closeWindow()
