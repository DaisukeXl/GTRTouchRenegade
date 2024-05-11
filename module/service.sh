#!/bin/sh
# © RayZTray @ telegram

### Functions:
```bash
function set_prop() {
    resetprop -n "$1" "$2"
}
```

### Properties configuration:
```bash
set_prop ro.kernel.android.checkjni 0
set_prop ro.config.nocheckin 1
set_prop dalvik.vm.dexopt-flags v=n,o=v,m=y,u=y
set_prop windowsmgr.max_events_per_sec 1000000
set_prop ro.sysmgr.scroll.fling_friction 0.001
set_prop debug.hwui.renderer.useBufferQueue true
set_prop debug.hwui.renderer.enable true
set_prop persist.dev.pm.dyn_samplingrate 30
set_prop touch.deviceType touchScreen
set_prop touch.size.calibration geometric
set_prop touch.pressure.calibration high
set_prop touch.gestureMode advanced
set_prop touch.distance.calibration area
set_prop touch.size.scale 30
set_prop touch.size.bias 20
set_prop touch.orientation.calibration interpolated
set_prop touch.orientationAware 1
set_prop vendor.perf.gestureflingboost.enable true
set_prop view.minimum_fling_velocity 1500
set_prop ro.surface_flinger.set_touch_timer_ms 1
set_prop persist.sys.purgeable_assets_enabled 1
set_prop debug.hwui.render_dirty_regions false
```

### Touch panel configuration:
```bash
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
```

### Touch boost verification and configuration:
```bash
if [[ -e "/sys/devices/virtual/touch/touch_dev/bump_sample_rate" ]]; then
    echo "1" > /sys/devices/virtual/touch/touch_dev/bump_sample_rate
elif [[ -e "/sys/touchpanel/double_tap" ]]; then
    echo '1' > /sys/touchpanel/double_tap
elif [[ -e "/sys/module/msm_performance/parameters/touchboost" ]]; then
    echo '1' > /sys/module/msm_performance/parameters/touchboost
elif [[ -e "/sys/power/pnpmgr/touch_boost" ]]; then
    echo '1' > /sys/power/pnpmgr/touch_boost
fi
```

### Running the script and exiting:
```bash
apply > /dev/null 2>&1
exit 0