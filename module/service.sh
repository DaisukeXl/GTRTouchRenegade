#!/bin/sh
# © RayZTray @ telegram

function set_prop() {
    resetprop -n "$1" "$2"
}

### Properties configuration:
setprop debug.performance.tuning 1
setprop debug.sf.no_hw_vsync 1
setprop debug.egl.swapinterval -1
setprop windowsmgr.max_events_per_sec 50000
settings put global animator_duration_scale 0
settings put global transition_animation_scale 0
setprop debug.hwui.renderer.disable_path_cache 1
setprop debug.hwui.overdraw show
setprop ro.kernel.android.checkjni 0
setprop ro.config.nocheckin 1
setprop dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y
setprop logcat.live disable 1
setprop persist.android.strictmode 0
setprop ro.secure 0
setprop ro.wmt.blcr.enable 0
setprop debug.kill_allocating_task 1
setprop touch.size.scale 100
setprop touch.size.bias 0
setprop touch.pressure.calibration "none"
setprop touch.gestureMode "fast"
setprop touch.distance.calibration "none"
setprop touch.swipe_follow_logo 0
setprop touch.edge.swipe 0
setprop touch.max_trackers 20
setprop view.minimum_fling_velocity 15000
setprop view.scroll_friction 0.001
setprop view.touch_slop 0

for i in /proc/touchpanel/*; do
chmod 0666 $i/game_switch_enable
chmod 0666 $i/oppo_tp_direction
chmod 0666 $i/oppo_tp_limit_enable
chmod 0666 $i/oplus_tp_limit_enable
chmod 0666 $i/oplus_tp_direction
chmod 0666 $i/report_rate
echo 1 > $i/game_switch_enable
echo 1 > $i/oppo_tp_direction
echo 0 > $i/oppo_tp_limit_enable
echo 0 > $i/oplus_tp_limit_enable
echo 1 > $i/oplus_tp_direction
echo 2000 > $i/report_rate
done

if [[ -e "/sys/devices/virtual/touch/touch_dev/bump_sample_rate" ]]; then
echo 2 > /sys/devices/virtual/touch/touch_dev/bump_sample_rate
chmod 0666 /sys/devices/virtual/touch/touch_dev/bump_sample_rate
elif [[ -e "/sys/touchpanel/double_tap" ]]; then
echo 2 > /sys/touchpanel/double_tap
chmod 0666 /sys/touchpanel/double_tap
fi

### Running the script and exiting:
apply > /dev/null 2>&1
exit 0