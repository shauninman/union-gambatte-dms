#!/bin/sh

BDAT=$(date +"%Y%m%d-%H%M%S")
echo '#define BUILDDATE "'$BDAT'"' >./gambatte_sdl/builddate.h

mkdir -p build/$PLATFORM

echo "cd libgambatte && scons"
(cd libgambatte && scons -Q target=$PLATFORM) || exit
echo "cd gambatte_sdl && scons"
(cd gambatte_sdl && scons -Q target=$PLATFORM)

mv gambatte_sdl/gambatte_sdl build/$PLATFORM/gambatte