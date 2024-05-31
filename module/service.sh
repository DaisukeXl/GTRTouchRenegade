#!/system/bin/sh
# TouchRevyG3 - Tweaks ottimizzati (con personalizzazioni)

# Funzione per impostare le proprietà di sistema in modo sicuro
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

setprop persist.vendor.camera.selfie.beauty.level 12
setprop persist.vendor.camera.selfie.sharpness.level 12
setprop persist.vendor.camera.selfie.contrast.level 12
setprop persist.vendor.camera.selfie.saturation.level 12
setprop persist.vendor.camera.selfie.noise.reduction 12
setprop ro.vendor.camera.selfie.ai.face.detect on
setprop ro.vendor.camera.selfie.ai.beauty.enable 1
setprop ro.vendor.camera.selfie.ai.lowlight.threshold 12
setprop ro.vendor.camera.selfie.ai.asd.enable 1
setprop persist.vendor.camera.selfie.expose.aux 1.5
setprop persist.vendor.camera.sensor.hdr 15
setprop persist.vendor.camera.remosaic.enabled 1
setprop persist.vendor.camera.feature.cac 4
setprop vendor.camera.aux.packagelist org.codeaurora.snapcam,com.android.camera,com.google.android.GoogleCamera
setprop vendor.debug.camera.enable 1
setprop vendor.camera.not.cts.apk 1
setprop vendor.camera.not.ctsverify.apk 1
setprop persist.vendor.camera.eis.enable 1
setprop persist.vendor.camera.ois.disable 0
setprop persist.vendor.camera.is_type 6
setprop persist.vendor.camera.mpo.enabled 2
setprop vendor.camera.hal1.packagelist com.whatsapp,com.instagram.android,com.snapchat.android,com.google.android.GoogleCamera
setprop ro.vendor.camera.ai.mode high_quality_plus
setprop ro.vendor.camera.ai.scene.detect pro_plus
setprop ro.vendor.camera.ai.hdr.enable 1
setprop ro.vendor.camera.ai.portrait.enable 1
setprop ro.vendor.camera.ai.lowlight.enable 1
setprop ro.vendor.camera.ai.supernight.enable 1
setprop ro.vendor.camera.ai.zoom.enable 1
setprop persist.vendor.camera.selfie.HAL3.enabled 1
setprop persist.vendor.camera.selfie.preview.ubwc 0
setprop persist.vendor.camera.selfie.stats.test 7
setprop persist.vendor.camera.selfie.isp.clock.optmz 1
setprop persist.vendor.camera.selfie.isp.turbo 2
setprop persist.vendor.camera.selfie.exif.make Google
setprop persist.vendor.camera.selfie.exif.model Pixel 8 Pro
setprop persist.vendor.camera.selfie.eis.enable 2
setprop persist.vendor.camera.selfie.ois.disable 0
setprop persist.vendor.camera.selfie.vid.stab.command 2
setprop ro.vendor.camera.selfie.ai.scene.detect on
setprop persist.vendor.camera.eis.enable 1
setprop persist.vendor.camera.ois.disable 0
setprop persist.vendor.camera.vid.stab.command 2
setprop persist.vendor.camera.gyro.disable 0
setprop persist.vendor.camera.is_type 6
setprop persist.vendor.camera.selfie.eis.enable 2
setprop persist.vendor.camera.selfie.ois.disable 0
setprop persist.vendor.camera.selfie.vid.stab.command 2
setprop persist.vendor.camera.selfie.gyro.disable 0
setprop dalvik.vm.dex2oat-filter speed-profile
setprop dalvik.vm.dex2oat-threads 12
setprop dalvik.vm.heapgrowthlimit 512m
setprop dalvik.vm.heapmaxfree 16m
setprop dalvik.vm.heapminfree 512k
setprop dalvik.vm.heapsize 512m
setprop dalvik.vm.heapstartsize 8m
setprop dalvik.vm.heaptargetutilization 0.75
setprop debug.sf.disable_backpressure true
setprop debug.sf.enable_gl_backpressure false
setprop debug.sf.gpu_comp_tiling false
setprop debug.sf.hw 0
setprop debug.sf.latch_unsignaled 1
setprop persist.vendor.qcomsysd.enabled false
setprop ro.lmk.use_minfree_levels true
setprop ro.vendor.extension_library /vendor/lib/libqti-perfd-client.so
setprop vendor.perf.gestureflingboost.enable true
setprop vendor.perf.iop_v3.enable true
setprop vendor.perf.scroll_opt true
setprop debug.hwui.use_buffer_age false
setprop debug.sf.early_app_phase_offset_ns -2000000
setprop debug.sf.early_gl_app_phase_offset_ns -2000000
setprop debug.sf.early_phase_offset_ns -2000000
setprop debug.sf.high_fps_early_gl_phase_offset_ns -8000000
setprop debug.sf.high_fps_early_phase_offset_ns -8000000
setprop persist.demo.hdmirotationlock false
setprop persist.sys.sf.color_saturation 1.2
setprop ro.hardware.vulkan 1
setprop ro.opengles.version 196610
setprop ro.surface_flinger.force_hwc_copy_for_virtual_displays true
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 4
setprop ro.surface_flinger.max_virtual_display_dimension 4096
setprop ro.surface_flinger.primary_display_orientation 0
setprop ro.surface_flinger.vsync_event_phase_offset_ns 0
setprop ro.surface_flinger.vsync_sf_event_phase_offset_ns 0
setprop video.disable.ubwc true
setprop video.enable.dynamic.quality.levels true
setprop windowsmgr.max_events_per_sec 320
setprop audio.deep_buffer.media true
setprop audio.offload.min.duration.secs 0
setprop audio.offload.gapless.enabled true
setprop audio.offload.pcm.16bit.enable true
setprop audio.offload.pcm.24bit.enable true
setprop persist.vendor.audio.fluence.speaker true
setprop persist.vendor.audio.fluence.voicecall true
setprop persist.vendor.audio.fluence.voicecomm true
setprop persist.vendor.audio.fluence.voicerec true
setprop ro.vendor.audio.sdk.ssr true
setprop vendor.audio.dolby.ds2.enabled true
setprop vendor.audio.dolby.ds2.hardbypass false
setprop vendor.audio.flac.sw.decoder.24bit true
setprop persist.vendor.data.mode 5g
setprop persist.vendor.radio.apm_sim_not_pwdn 1
setprop persist.vendor.radio.custom_ecc 1
setprop persist.vendor.radio.data_con_rprt 1
setprop persist.vendor.radio.rat_on combine
setprop persist.vendor.radio.sib16_support 1
setprop ril.subscription.types RUIM
setprop debug.cpurend.vsync 0
setprop debug.mdpcomp.maxlayer 4
setprop debug.performance.tuning 1
setprop debug.sf.disable_vds true
setprop debug.sf.enable_hwc_vds true
setprop debug.sf.layer_caching true
setprop debug.stagefright.ccodec 1
setprop debug.stagefright.omx_default_rank.sw-audio 1
setprop persist.sys.use_dithering 1
setprop ro.vendor.display.ad.hdr_calib_data /vendor/etc/hdr_config.cfg
setprop ro.vendor.display.ad.sdr_calib_data /vendor/etc/sdr_config.cfg
setprop vendor.gralloc.disable_ubwc true
setprop ro.build.version.release 14
setprop ro.product.cpu.abi arm64-v8a
setprop ro.zygote zygote64_32
setprop persist.sys.animation_duration_scale 0.5
setprop persist.sys.enable_prefetch 1
setprop persist.sys.force_highendgfx true
setprop persist.sys.scrollingcache 3
setprop persist.sys.use_16bpp_alpha 1
setprop persist.vendor.radio.data_con_rprt 2
setprop persist.vendor.radio.eri 60
setprop persist.vendor.radio.force_tdscdma_off 1
setprop persist.vendor.radio.mt_sms_ack 30
setprop persist.vendor.radio.no_wait_for_card 1
setprop persist.vendor.radio.relay_oprt_change 1
if pgrep -f "/system/bin/cameraserver" > /dev/null; then 
    pkill -f "/system/bin/cameraserver"
    sleep 1
    /system/bin/cameraserver &
fi
