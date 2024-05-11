#!/bin/sh
# © RayZTray @ telegram

function set_prop() {
    resetprop -n "$1" "$2"
}

apply() {

setprop ro.kernel.android.checkjni 0
setprop ro.config.nocheckin 1
setprop dalvik.vm.dexopt-flags v=n,o=v,m=y,u=y
setprop windowsmgr.max_events_per_sec 1000000
setprop ro.sysmgr.scroll.fling_friction 0.001
setprop debug.hwui.renderer.useBufferQueue true
setprop debug.hwui.renderer.enable true
setprop persist.dev.pm.dyn_samplingrate 30
setprop touch.deviceType touchScreen
setprop touch.size.calibration geometric
setprop touch.pressure.calibration high
setprop touch.gestureMode advanced
setprop touch.distance.calibration area
setprop touch.size.scale 30
setprop touch.size.bias 20
setprop touch.orientation.calibration interpolated
setprop touch.orientationAware 1
setprop vendor.perf.gestureflingboost.enable true
setprop view.minimum_fling_velocity 1500
setprop ro.surface_flinger.set_touch_timer_ms 1
settings put global block_untrusted_touches 0
setprop persist.sys.purgeable_assets_enabled 1
setprop debug.hwui.render_dirty_regions false

for i in /proc/touchpanel; do
    echo '1' > $i/game_switch_enable
    echo '1' > $i/oppo_tp_direction
    echo '0' > $i/oppo_tp_limit_enable
    echo '0' > $i/oplus_tp_limit_enable
    echo '1' > $i/oplus_tp_direction
done

for i in /proc/touchpanel/*; do
    echo '1' > $i/game_switch_enable
    echo '1' > $i/oppo_tp_direction
    echo '0' > $i/oppo_tp_limit_enable
    echo '0' > $i/oplus_tp_limit_enable
    echo '1' > $i/oplus_tp_direction
done

if [[ -e "/sys/devices/virtual/touch/touch_dev/bump_sample_rate" ]]; then
    echo "1" > /sys/devices/virtual/touch/touch_dev/bump_sample_rate
elif [[ -e "/sys/touchpanel/double_tap" ]]; then
    echo '1' > /sys/touchpanel/double_tap
elif [[ -e "/sys/module/msm_performance/parameters/touchboost" ]]; then
    echo '1' > /sys/module/msm_performance/parameters/touchboost
elif [[ -e "/sys/power/pnpmgr/touch_boost" ]]; then
    echo '1' > /sys/power/pnpmgr/touch_boost
fi
}

apply > /dev/null 2>&1
exit 0