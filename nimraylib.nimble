# Package

version       = "0.1.0"
author        = "Justin Ryan Hurstwright"
description   = "Nim wrapper for raylib"
license       = "MIT"

skipDirs = @["tests"]

# Dependencies

requires "nimgen >= 0.5.1"

var
  name = "nimraylib"
  cmd = when defined(Windows): "cmd /c " else: ""

mkDir(name)

task setup, "Checkout and generate":
  if gorgeEx(cmd & "nimgen").exitCode != 0:
    withDir(".."):
      exec "nimble install nimgen -y"
  exec cmd & "nimgen " & name & ".cfg"

before install:
  setupTask()

