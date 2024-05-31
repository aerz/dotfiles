#!/usr/bin/env sh

swaylock \
   --daemonize \
   --image "$(xdg-user-dir PICTURES)/Wallpapers/default-$(darkman get).png" \
   --scaling fill \
   --effect-pixelate 2 \
   --grace 3 --grace-no-mouse \
   --clock --timestr "%H:%M" --datestr "%b %e %a" \
   --indicator --indicator-radius 70
