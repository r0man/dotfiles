#!/usr/bin/env bash

for source in "*.svg"; do
    ls *.src
    # target="icons/`basename $source .xbm`.xpm"
    # # convert shapes to blue
    # convert -fill "#54728e" -opaque black $source $target
    # # convert background to black
    # convert -fill "#111111" -opaque white $target $target
done

# convert -fill "#54728e" -background black ic_schedule_black_48px.svg ic_schedule_black_48px.xpm
# inkscape ic_schedule_white_48px.svg -b black --export-png=ic_schedule_white_48px.png

# convert -fill "#54728e" ic_schedule_white_48px.png ic_schedule_white_48px.xpm


# inkscape ic_schedule_white_48px.svg -b black --export-png=ic_schedule_white_48px.png
# convert -stroke "#54728e" ic_schedule_white_48px.png ic_schedule_white_48px.xpm


# convert -opaque white -fill "#54728e" ic_schedule_white_48px.png ic_schedule_white_48px.xpm
# convert -opaque white -fill "#54728e" ic_schedule_white_48px.png ic_schedule_white_48px.xpm

# convert -fill red -draw 'color 255,255 replace' ic_schedule_white_48px.png ic_schedule_white_48px.xpm

# convert -fuzz 10 -fill "#54728e" -opaque white ic_schedule_white_48px.png ic_schedule_white_48px.xpm

# convert -fill "#54728e" -stroke white ic_schedule_white_48px.png ic_schedule_white_48px.xpm

# convert -stroke "#54728e" -opaque white ic_schedule_white_48px.png ic_schedule_white_48px.xpm

# convert -stroke "#54728e" -opaque white ic_schedule_white_48px.svg ic_schedule_white_48px.xpm


# inkscape ic_schedule_white_18px.svg -b "#111111" --export-png=ic_schedule_white_18px.png

# convert -fill "red" -opaque black ic_schedule_white_18px.svg ic_schedule_blue_18px.xpm
# cp ic_schedule_blue_18px.xpm /tmp


# sed -e 's/#FFFFFF/#54728e/g' ic_schedule_white_18px.svg
