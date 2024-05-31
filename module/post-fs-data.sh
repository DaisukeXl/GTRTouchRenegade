#!/system/bin/sh
MODDIR ${0%/*}
#
resetprop -n sys.wifitracing.started 0
resetprop -n persist.vendor.wifienhancelog 0
