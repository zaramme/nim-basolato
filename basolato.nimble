# Package

version       = "0.1.0"
author        = "Hidenobu Itsumura @dumblepytech1 as 'medy'"
description   = "A fullstack web framework library for Nim"
license       = "MIT"
srcDir        = "src"
backend       = "c"
bin           = @["basolato/cli/ducere"]
binDir        = "src/bin"
installExt    = @["nim"]
skipDirs      = @["basolato/cli"]

# Dependencies

requires "nim >= 1.0.0"
requires "cligen >= 0.9.41"
requires "jester >= 0.4.3"
requires "templates >= 0.5"
requires "https://github.com/enthus1ast/flatdb >= 0.2.4"
requires "https://github.com/itsumura-h/nim-allographer >= 0.7.0"

import strformat
from os import `/`

task docs, "Generate API documents":
  let
    deployDir = "deploy" / "docs"
    pkgDir = srcDir / "basolato"
    srcFiles = @[
      "base","controller","logger","middleware","routing","view"
    ]

  if existsDir(deployDir):
    rmDir deployDir
  for f in srcFiles:
    let srcFile = pkgDir / f & ".nim"
    exec &"nim doc --hints:off --project --out:{deployDir} --index:on {srcFile}"
