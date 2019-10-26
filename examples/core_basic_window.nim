import nimraylib

initWindow(800, 450, "raylib [core] examples - basic window")

while not windowShouldClose():
  beginDrawing()
  clearBackground(Raywhite)
  drawText("Congrats! You create first window!", 190, 200, 20, Lightgray)
  endDrawing()

closeWindow()
