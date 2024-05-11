#!/bin/sh
# © RayZTray @ telegram

function set_prop() {
    resetprop -n "$1" "$2"
}

apply() {
    setprop ro.kernel.android.checkjni 0
    setprop ro.config.nocheckin 1
    setprop dalvik.vm.dexopt-flags=v=n,o=v,m=y,u=y
    setprop logcat.live disable
    setprop sys.use_fifo_ui 1
    setprop debug.slide.duration 0.001
    setprop debug.duration_tap 0.001
    setprop touch.pressure.scale 100
    setprop touch.size.isSummed 1
    setprop view.touch_slop 0.001
    settings put secure multi_press_timeout 0.01
    settings put secure long_press_timeout 0.1
    settings put global animator_duration_scale 0
    settings put global transition_animation_scale 0
    setprop PointerLocationMaxPointers 4096
    setprop PointerLocationMinMotion 0.000000001px
    setprop PointerLocationSamplingInterval 0.000000001
    setprop windowsmgr.max_events_per_sec 1000000
    setprop ro.HAL_WINDOWBG_IDLE_FACTOR 1000
    setprop ro.HAL_WINDOWMG_SYS_FACTOR 1000
    setprop ro.HAL_WINDOWMG_STAYON_FACTOR 1000
    setprop ro.sensor.delay 0
    setprop ro.sysmgr.scroll.fling_friction 0.001
    setprop debug.hwui.renderer.useBufferQueue true
    setprop debug.hwui.renderer.enable true
    setprop windowsmgr.max_events_per_sec 1000000
    setprop MultitouchMinDistance 0.000000001
    setprop MultitouchSettleInterval 0.000000001
    setprop TapSlop 0.001
    setprop double_tap_timeout 0.1
    setprop ro.sys.fw.bg_apps_limit 128
    setprop debug.composition.type gpu
    setprop windowsmgr.max_events_per_sec 1000
    setprop ro.config.hw_fast_dormancy 1
    setprop ro.kernel.android.bootanim 1

    for i in /proc/touchpanel; do
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

    echo '100' > /sys/devices/virtual/touch/touch_dev/sample_timeout
    echo '1' > /sys/devices/virtual/touch/touch_dev/motion_threshold
    echo '1' > /sys/module/msm_input/parameters/input_boost_enabled
    echo '100' > /sys/module/msm_input/parameters/input_boost_duration
    echo '1' > /sys/module/msm_performance/parameters/touch_input_boost
    echo '1' > /sys/module/msm_performance/parameters/enabled
    echo '1' > /sys/module/msm_performance/parameters/touchboost
    echo '1' > /sys/devices/virtual/touch/gesture_boost

    setprop view.scroll_friction 0.000001
    setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 200
    setprop ro.surface_flinger.set_idle_timer_ms 1
    setprop persist.dev.pm.dyn_samplingrate 30
    setprop touch.deviceType touchScreen
    setprop touch.size.calibration geometric
    setprop touch.pressure.calibration high
    setprop ro.min_pointer_dur 2
    setprop touch.gestureMode advanced
    setprop persist.sys.scrollingcache 512
    setprop persist.sys.ui.hw 10
    setprop touch.size.scale 30
    setprop touch.size.bias 20
    setprop touch.orientation.calibration interpolated
    setprop touch.distance.scale 6.0
    setprop touch.distance.calibration area
    setprop touch.coverage.calibration box
    setprop touch.orientationAware 1
    setprop vendor.perf.gestureflingboost.enable true
    setprop view.minimum_fling_velocity 1500
    setprop ro.surface_flinger.set_touch_timer_ms 1
    settings put global block_untrusted_touches 0
}

apply > /dev/null 2>&1
exit 0