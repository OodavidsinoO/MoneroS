#!/bin/sh

# System initialization sequence:
#
# /init
#  |
#  +--(1) /etc/01_prepare.sh
#  |
#  +--(2) /etc/02_overlay.sh
#          |
#          +-- /etc/03_init.sh
#               |
#               +-- /sbin/init
#                    |
#                    +--(1) /etc/04_bootscript.sh (this file)
#                    |       |
#                    |       +-- /etc/autorun/* (all scripts)
#                    |
#                    +--(2) /bin/sh (Alt + F1, main console)
#                    |
#                    +--(2) /bin/sh (Alt + F2)
#                    |
#                    +--(2) /bin/sh (Alt + F3)
#                    |
#                    +--(2) /bin/sh (Alt + F4)

echo -e "Welcome to \\e[0;33mMoneroS Mining Linux\\e[0m~ (/sbin/init)"
echo -e "Version: \\e[0;33m$(cat /etc/version)\\e[0m"
echo -e "Author: \\e[0;32mDavid Sin\\e[0m"

# Autorun functionality
if [ -d /etc/autorun ] ; then
for AUTOSCRIPT in /etc/autorun/*
  do
    if [ -f "$AUTOSCRIPT" ] && [ -x "$AUTOSCRIPT" ]; then
      echo -e "[AUTORUN] Executing \\e[32m$AUTOSCRIPT\\e[0m in subshell."
      $AUTOSCRIPT
    fi
  done
fi

