import nimraylib

InitWindow(800, 450, "raylib [core] examples - basic window")

while not WindowShouldClose():
  BeginDrawing()
  ClearBackground(Raywhite)
  DrawText("Congrats! You create first window!", 190, 200, 20, Lightgray)
  EndDrawing()

CloseWindow()
