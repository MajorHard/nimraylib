import nimraylib

const
  screenWidth = 800
  screenHeight = 450

initWindow(screenWidth, screenHeight, "raylib [core] examples - 3d camera mode")

var
  camera = Camera3D(
    position: Vector3(x: 0, y: 10, z: 10),
    target:   Vector3(x: 0, y: 0,  z: 0),
    up:       Vector3(x: 0, y: 1,  z: 0),
    fovy:     45'f32,
    `type`: CAMERA_PERSPECTIVE
  )

  cubePosition = Vector3(x: 0, y: 0, z: 0)

while not windowShouldClose():
  block draw:
    beginDrawing()
    defer: endDrawing()
    clearBackground(RayWhite)

    block draw3d:
      beginMode3D(camera)
      defer: endMode3D()

      drawCube(cubePosition, 2, 2, 2, Red)
      drawCubeWires(cubePosition, 2, 2, 2, Maroon)
      drawGrid(10, 1)

    drawText("Welcome to the thrid dimension!", 10, 40, 20, DarkGray)
    drawFPS(10, 10)

closeWindow()
