#!/bin/sh

function setup_space {
  local idx="$1"
  local name="$2"
  local space=
  echo "setup space $idx : $name"

  space=$(yabai -m query --spaces --space "$idx")
  if [ -z "$space" ]; then
    yabai -m space --create
  fi

  yabai -m space "$idx" --label "$name"
}

setup_space 1 web
setup_space 2 code
setup_space 3 chats
setup_space 4 notes
setup_space 5 events
setup_space 6 music

