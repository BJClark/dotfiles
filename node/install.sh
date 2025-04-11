#!/bin/sh
#
# Node
#
# Node.js is now managed by mise
# Check ~/.mise.toml for Node.js configuration
# Bun is the primary JS runtime - see bun/ directory

if test ! $(which spoof)
then
  if test $(which npm)
  then
    sudo npm install spoof -g
  fi
fi
