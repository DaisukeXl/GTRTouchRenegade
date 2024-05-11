#!/bin/sh
wok=/data/adb/modules
if [[ ! -d "$wok/TouchRevyG3" ]]; then
settings put global animator_duration_scale 1.0
settings put global transition_animation_scale 1.0
settings put global window_animation_scale 1.0
settings delete secure multi_press_timeout
settings delete secure long_press_timeout
settings delete global block_untrusted_touches
rm -rf /sdcard/TouchSmoothnessG3Uninstall.sh
echo "Done"
else
echo "module deleted!"
exit 1
fi