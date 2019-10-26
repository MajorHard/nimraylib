import nimraylib

const
  screenWidth = 800
  screenHeight = 450
  maxGestureString = 20

InitWindow(screenWidth, screenHeight, "raylib [core] examples - input gestures")

var
  finger1 = Vector2( x: 0, y: 0 )
  finger2 = Vector2( x: 0, y: 0 )
  touchArea = Rectangle( x: 220, y: 10, width: screenWidth - 230, height: screenHeight - 20)
  gestureCount = 0'i32
  gestureStrings = newSeq[string](maxGestureString)
  currentGesture= GestureType.GESTURE_NONE
  lastGesture = GestureType.GESTURE_NONE

SetTargetFPS(60)

while not WindowShouldClose():
  lastGesture = currentGesture
  currentGesture = GetGestureDetected()
  finger1 = GetTouchPosition(0)
  finger2 = GetTouchPosition(0)

  if currentGesture != lastGesture and currentGesture != GESTURE_NONE:
    case currentGesture:
      of GESTURE_TAP: gestureStrings[gestureCount] = "GESTURE TAP"
      of GESTURE_DOUBLETAP: gestureStrings[gestureCount] = "GESTURE DOUBLETAP"
      of GESTURE_HOLD: gestureStrings[gestureCount] = "GESTURE HOLD"
      of GESTURE_DRAG: gestureStrings[gestureCount] = "GESTURE DRAG"
      of GESTURE_SWIPE_DOWN: gestureStrings[gestureCount] = "GESTURE SWIPE DOWN"
      of GESTURE_SWIPE_UP: gestureStrings[gestureCount] = "GESTURE SWIPE UP"
      of GESTURE_SWIPE_LEFT: gestureStrings[gestureCount] = "GESTURE SWIPE LEFT"
      of GESTURE_SWIPE_RIGHT: gestureStrings[gestureCount] = "GESTURE SWIPE RIGHT"
      of GESTURE_PINCH_IN: gestureStrings[gestureCount] = "GESTURE PINCH IN"
      of GESTURE_PINCH_OUT: gestureStrings[gestureCount] = "GESTURE PINCH OUT"
      of GESTURE_NONE: discard
    gestureCount += 1

    if gestureCount >= maxGestureString:
      for i in 0..(maxGestureString - 1):
        gestureStrings[i] = "\0"
        gestureCount = 0

  block draw:
    BeginDrawing()
    defer: EndDrawing()
    ClearBackground(RayWhite)

    DrawRectangleRec(touchArea, Gray)
    DrawRectangle(225, 15, screenWidth - 240, screenHeight - 30, RayWhite)
    DrawText("GESTURE TEST AREA", screenWidth - 270, screenHeight - 40, 20, Fade(Gray, 0.5))

    for i in 0..gestureCount:
      if i mod 2 == 0: DrawRectangle(10, 30 + 20 * i, 200, 20, Fade(LightGray, 0.5))
      else: DrawRectangle(10, 30 + 20 * i, 200, 20, Fade(LightGray, 0.3))

      if (i < gestureCount): DrawText(gestureStrings[i], 35, 36 + 20 * i, 10, DarkGray)
      else: DrawText(gestureStrings[i], 35, 36 + 20 * i, 10, Maroon)
    DrawRectangleLines(10, 29, 200, screenHeight - 50, Gray)
    DrawText("DETECT GESTURES", 50, 15, 10, Gray)

    if currentGesture != GESTURE_NONE: DrawCircleV(finger1, 30, Maroon)
    if currentGesture != GESTURE_NONE: DrawCircleV(finger2, 30, Maroon)



CloseWindow()
