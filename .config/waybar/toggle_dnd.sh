#!/bin/bash

if [ "$1" = "toggle" ]; then
  makoctl mode -t hide
  exit 0
fi

if makoctl mode | grep -q hide; then
  echo "[ DND: On ]"
else
  echo "[ DND: Off ]"
fi
