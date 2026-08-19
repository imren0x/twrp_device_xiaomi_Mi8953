#!/sbin/sh

set_device_codename() {
	resetprop "ro.build.product" "$1"
	resetprop "ro.omni.device" "$1"
	resetprop "ro.product.device" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.device" "$1"
	done
}

set_device_model() {
	resetprop "ro.product.model" "$1"
	for i in odm product system system_ext vendor; do
		resetprop "ro.product.${i}.model" "$1"
	done
}

case "$(cat /sys/xiaomi-msm8953-mach/codename)" in
	"ysl")
		set_device_codename "ysl"
		set_device_model "Redmi S2/Y2"
		;;
	"vince")
		set_device_codename "vince"
		set_device_model "Redmi 5 Plus"
		;;
	"mido")
		set_device_codename "mido"
		set_device_model "Redmi Note 4/4x"
		;;
	"rosy")
		set_device_codename "rosy"
		set_device_model "Redmi 5"
		;;
esac

exit 0