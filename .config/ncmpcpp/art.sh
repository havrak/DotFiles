#!/usr/bin/env sh

#-------------------------------#
# Generate current song cover   #
# ffmpeg version                #
#-------------------------------#

# Path to music directory
MUSIC_DIR="$HOME/mus"
# Path to output cover
COVER="$HOME/bin/scripts/files/cover.png"
# Size of cover
COVER_SIZE=315
# Size in pixel of borders to crop out
CROP_BORDER=0
# Radius or rounded borders
BORDER_RADIUS=0


ffmpeg_cover() {
    ffmpeg -loglevel 0 -y -i "$1" -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" "$COVER"
}


fallback_find_cover() {
    album=$(dirname "$file")
    album_cover="$(find "$album" -type d -exec find {} -maxdepth 1 -type f -iregex ".*\(covers?\|folders?\|artworks?\|fronts?\|scans?\).*[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    [ -z "$album_cover" ] && album_cover="$(find "$album" -type d -exec find {} -maxdepth 1 -type f -iregex ".*[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    [ -z "$album_cover" ] && album_cover="$(find "${album%/*}" -type d -exec find {} -maxdepth 1 -type f -iregex ".*\(covers?\|folders?\|artworks?\|fronts?\|scans?\|booklets?\).*[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    album_cover="$(echo -n "$album_cover" | grep -iv '\(back\|cd\)\.' | head -n1)"
}

main() {
    file="$MUSIC_DIR/$(mpc --format %file% current)"

    [ -n "$file" ] && ffmpeg_cover "$file" ||
        fallback_find_cover && ffmpeg_cover "$album_cover"
}

main
