#!/usr/bin/env bash

FG_COLOR="#54728e"
BG_COLOR="#111111"

for source in ic_*white_*.svg; do

    echo $source
    
    # Convert white SVG to blue
    blue=$(echo $source | sed 's/white/blue/g')
    sed -e "s/#FFFFFF/$FG_COLOR/g" $source > $blue

    # Save as png with black background
    png=$(echo $blue | sed 's/svg/png/g')
    inkscape $blue -b $BG_COLOR --export-png=$png
    echo $png

    xpm=$(echo $png | sed 's/png/xpm/g')
    convert $png $xpm
    
    # echo inkscape $blue -b black --export-png=$png
    # target="icons/`basename $source .xbm`.xpm"
    # # convert shapes to blue
    # convert -fill "#54728e" -opaque black $source $target
    # # convert background to black
    # convert -fill "#111111" -opaque white $target $target
    echo ""
done
