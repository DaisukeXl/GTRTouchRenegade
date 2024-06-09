#!/system/bin/sh
# TouchRevyG3
write() {
	# Bail out if file does not exist
	[[ ! -f "$1" ]] && return 1
	
	# Make file writable in case it is not already
	chmod +w "$1" 2> /dev/null

	# Write the new value and bail if there's an error
	if ! echo "$2" > "$1" 2> /dev/null
	then
		echo "Failed: $1 → $2"
		return 1
	fi
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 2265600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 364800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo 2265600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 364800 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo 3148800 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 499200 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo 3148800 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo 499200 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo 3148800 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 499200 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo 2956800 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 499200 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo 2956800 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo 499200 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
echo 3052800 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
echo 480000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
chmod 644 /sys/class/kgsl/kgsl-3d0/max_pwrlevel
echo 1 > /sys/class/kgsl/kgsl-3d0/max_pwrlevel
chmod 644 /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo 903000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
chmod 644 /proc/sys/vm/swappiness
echo 0 > /proc/sys/vm/swappiness
}

setprop_safe() {
    prop="$1"
    value="$2"

    current_value=$(getprop "$prop")
    if [ "$current_value" != "$value" ]; then
        resetprop -n "$prop" "$value" 
        echo "Impostata la proprietà: $prop = $value" 
    else
        echo "Proprietà già impostata: $prop = $current_value" 
    fi
}

# Carica le modifiche personalizzate da tweaks.txt
while IFS= read -r line; do
    prop="${line%=*}"
    value="${line#*=}"
    setprop_safe "$prop" "$value"
done < /data/adb/modules/TouchRevyG3/service.sh

setprop touchscreen.sensitivity 15
setprop touchscreen.min_press_time 30
setprop touchscreen.hovering 0
setprop touchscreen.gesture_mode 1
setprop touchscreen.pointer_speed 15
setprop touchscreen.pressure_calibration 1023
setprop touchscreen.sensitivity_mode 3
setprop touchscreen.threshold 7
setprop touchscreen.sensitivity_threshold 7
setprop touchscreen.double_tap_speed 75
setprop touchscreen.long_press_timeout 300
setprop touchscreen.sensitivity_scale 1.8
setprop persist.sys.use_dithering=0
setprop persist.sys.use_dithering=false
setprop DragMinSwitchSpeed 5000.0
setprop SwipeMaxWidthRatio 0.8
setprop ZoomSpeedRatio 1.2
setprop SwipeTransitionAngleCosine 0.8
setprop mot.proximity.distance 1
setprop PointerVelocityControlParameters 1
setprop lowThreshold 0
setprop highThreshold 0
setprop VirtualKeyQuietTime 0
setprop KeyRepeatDelay 0
setprop KeyRepeatTimeout 0
setprop persist.vendor.qti.inputopts.enable true
setprop persist.vendor.qti.inputopts.movetouchslop 0.1
setprop ro.sf.delayedtouches 0
setprop touch.orientationAware 1
setprop SurfaceOrientation auto
setprop touch.size.calibration geometric
setprop touch.size.scale 1.2
setprop touch.size.isSummed 1
setprop persist.device_config.runtime_native.usap_pool_enabled true
setprop touch.orientation.calibration offset
setprop touch.distance.calibration diameter
setprop touch.deviceType stylus
setprop touch.distance.scale 1.2
setprop touch.coverage.calibration fitted
setprop touch.pressure.scale 1.2
setprop touch.gesturemode spots
setprop MultitouchMinDistance 5px
setprop MultitouchSettleInterval 5ms
setprop TapInterval 100ms
setprop QuietInterval 50ms
setprop MovementSpeedRatio 1.5
setprop TapSlop 10px
setprop persist.dev.pm.dyn_samplingrate 1000000
setprop touch.pressure.calibration fitted
setprop scroll.accelerated.hw true
setprop persist.sys.ui.hwframes 60
setprop persist.sys.force_high_end_gfx 1
setprop view.scroll_friction 0.015
setprop ro.min_pointer_dur 8ms
setprop ro.sf.disable_smooth_effect false
setprop ro.product.multi_touch_enabled true
setprop ro.product.max_num_touch 10
setprop ro.window.animation.scale 0.5
setprop ro.transition.animation.scale 0.5
setprop view.touch_slop 8dp
setprop video.accelerate.hw 1
setprop view.scroll_friction 0
setprop window_animation_scale 0
setprop transition_animation_scale 0
setprop animator_duration_scale 0
setprop fstrim_mandatory_interval 43200000
setprop multi_press_timeout 80
setprop long_press_timeout 80
setprop view.scroll_friction 0.005
setprop ro.min_pointer_dur 6
setprop touch.deviceType touchScreen
fi

exit 0