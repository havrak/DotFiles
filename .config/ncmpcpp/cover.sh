#!/usr/bin/env bash

#-------------------------------#
# Display current cover         #
#-------------------------------#

source "`ueberzug library`"

COVER="/tmp/cover.png"

function add_cover() {
  ImageLayer::add [identifier]="cover" [x]="0" [y]="0" [path]="$COVER"
}

function remove_cover() {
  ImageLayer::remove [identifier]="cover"
}

function you_wait() {
  while inotifywait -q -q -e close_write "$COVER"; do
  	add_cover
  done
}

ImageLayer 0< <(
  add_cover
  you_wait
)
