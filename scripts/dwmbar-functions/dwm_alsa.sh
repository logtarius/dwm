#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

VOLUME_ON_ICON=''
VOLUME_MUTED_ICON=''

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "$VOLUME_MUTED_ICON %s%%" "$VOL"
        else
            printf "$VOLUME_ON_ICON %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
}

