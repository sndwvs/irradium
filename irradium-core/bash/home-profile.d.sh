#!/bin/bash

if [ -d "$HOME/.profile.d" ]; then
  for i in "$HOME"/.profile.d/*.sh; do
    if [ -x "$i" ]; then
      . "$i"
    fi
  done
fi

unset i
