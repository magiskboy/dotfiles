#/bin/bash

MOUSES=$(xinput --list | grep Mouse | cut -f2 | cut -d= -f2)

for D in $MOUSES; do
    xinput --set-prop $D 'libinput Accel Speed' -0.9    
done

