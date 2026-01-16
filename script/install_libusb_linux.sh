#!/bin/bash

set -e

echo "=== libusb installation for Linux ==="

# root 권한 체크
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run as root (sudo)"
    exit 1
fi

# 배포판 판별
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "[ERROR] Cannot detect Linux distribution"
    exit 1
fi

echo "[INFO] Detected distro: $DISTRO"

# libusb 설치
case "$DISTRO" in
    ubuntu|debian|raspbian)
        apt update
        apt install -y libusb-1.0-0 libusb-1.0-0-dev
        ;;
    fedora)
        dnf install -y libusb1 libusb1-devel
        ;;
    centos|rhel)
        yum install -y libusbx libusbx-devel || true
        ;;
    arch)
        pacman -Sy --noconfirm libusb
        ;;
    *)
        echo "[ERROR] Unsupported distribution: $DISTRO"
        echo "Please install libusb-1.0 manually."
        exit 1
        ;;
esac

echo "[OK] libusb installed"

# udev rule 설치
UDEV_RULE_FILE="/etc/udev/rules.d/99-myusb-sdk.rules"

echo "[INFO] Installing udev rules: $UDEV_RULE_FILE"

cat <<EOF > $UDEV_RULE_FILE
# MyUSB SDK - allow user access to USB device
SUBSYSTEM=="usb", ATTR{idVendor}=="1fc9", ATTR{idProduct}=="0099", MODE="0666"
EOF

udevadm control --reload-rules
udevadm trigger

echo "[OK] udev rules installed"
echo "You may need to unplug and replug the device."

echo "=== libusb installation completed ==="
