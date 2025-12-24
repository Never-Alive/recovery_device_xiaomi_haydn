#!/system/bin/sh

# helper function
set_device_props() {
    DEVICE="$1"
    NAME="$2"
    MODEL="$3"

    # device identifiers
    resetprop ro.build.product "$DEVICE"
    resetprop ro.product.device "$DEVICE"
    resetprop ro.product.odm.device "$DEVICE"
    resetprop ro.product.vendor.device "$DEVICE"
    resetprop ro.product.product.device "$DEVICE"
    resetprop ro.product.system.device "$DEVICE"
    resetprop ro.product.system_ext.device "$DEVICE"

    resetprop ro.product.name "$NAME"
    resetprop ro.product.odm.name "$NAME"
    resetprop ro.product.vendor.name "$NAME"
    resetprop ro.product.product.name "$NAME"
    resetprop ro.product.system.name "$NAME"
    resetprop ro.product.system_ext.name "$NAME"

    # model
    resetprop ro.product.model "$MODEL"
    resetprop ro.product.odm.model "$MODEL"
    resetprop ro.product.vendor.model "$MODEL"
    resetprop ro.product.product.model "$MODEL"
    resetprop ro.product.system.model "$MODEL"
    resetprop ro.product.system_ext.model "$MODEL"
}

resetprop ro.build.date.utc 1609430400
resetprop ro.bootimage.build.date.utc 1609430400

SKU="$(getprop ro.boot.hardware.sku)"
HWC="$(getprop ro.boot.hwc)"

echo "[haydn] SKU=$SKU HWC=$HWC"

case "$SKU" in
    haydn)
        if [ "$HWC" = "CN" ]; then
            # Redmi K40 Pro (China)
            set_device_props "haydn" "haydn" "Redmi K40 Pro"
        else
            # Mi 11i (Global/EU)
            set_device_props "haydn" "haydn" "Mi 11i"
        fi
        ;;
    haydn_in)
        # Mi 11X Pro (India)
        set_device_props "haydnin" "haydn_in" "Mi 11X Pro"
        ;;
    *)
        set_device_props "unknown" "unknown" "unknown"
        ;;
esac

exit 0
