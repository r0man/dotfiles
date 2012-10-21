#!/usr/bin/env bash

for source in ~/Downloads/xbm8x8/*.xbm; do
    target="icons/`basename $source .xbm`.xpm"
    # convert shapes to blue
    convert -fill "#54728e" -opaque black $source $target
    # convert background to black
    convert -fill "#111111" -opaque white $target $target
done
