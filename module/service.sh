#!/bin/sh
# © RayZTray @ telegram

function set_prop() {
    resetprop -n "$1" "$2"
}
setprop persist.demo.mode false
setprop windowsmgr.max_events_per_sec 2000
setprop ro.max.fling_velocity 20000
setprop ro.min.fling_velocity 10000
setprop view.scroll_friction 0.003
setprop view.touch_slop 0.0005
setprop persist.sys.scrollingcache 3
setprop touch.gestureMode advanced_smooth
setprop pm.sleep_mode 2
setprop ro.min_pointer_speed 0.05
setprop persist.sys.sensor.display.prefer 1
setprop debug.hwui.renderer.disable_path_cache 0
setprop persist.demo.mode false
setprop debug.hwui.renderer.enable true
setprop touch.pressure.calibration high
setprop touch.gestureMode advanced
setprop persist.sys.nativewindow.constrained maximizable  
setprop ro.sf.larger.display.selection.timeout 1000  
setprop ro.sf.in_picture.disable on  
setprop hwui.touch_rescale 2  
setprop hwui.render_dirty_regions 1  
setprop hwui.disable_vsync 1
settings put system block_untrusted_touches 0
settings put global block_untrusted_touches 0
settings put secure block_untrusted_touches 0
settings put global block_untrusted_touches 0
setprop debug.hwui.overdraw_count 0
setprop debug.hwui.overdraw_color 0
setprop debug.hwui.show_dirty_regions false
setprop view.animator_duration_scale 0.5
setprop persist.sys.ui.hw true
setprop persist.sys.dalvik.vm.lib 2
setprop ro.config.max_texture_size_mb 6144
setprop ro.config.max_empty_tex_group_count 32
setprop ro.config.max_cached_buffers 8
setprop ro.config.max_accurate_textures 3
setprop ro.config.max_accurate_vertices 3
setprop ro.config.max_texture_stream_tiles 32
setprop ro.config.max_texture_upload_cpu_buffer_size 65536

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

apply > /dev/null 2>&1
exit 0
