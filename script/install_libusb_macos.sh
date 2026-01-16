#!/bin/bash
set -e

echo "=== libusb installation for macOS ==="

# Homebrew 존재 확인
if ! command -v brew >/dev/null 2>&1; then
    echo "[INFO] Homebrew not found. Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon 환경 PATH 보정
    if [ -d /opt/homebrew/bin ]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "[OK] Homebrew found"
fi

# libusb 설치
echo "[INFO] Installing libusb..."
brew update
brew install libusb || brew upgrade libusb

echo "[OK] libusb installed"

# 설치 확인
LIBUSB_PATH=$(brew --prefix libusb)/lib/libusb-1.0.dylib

if [ -f "$LIBUSB_PATH" ]; then
    echo "[OK] libusb dylib found at:"
    echo "     $LIBUSB_PATH"
else
    echo "[ERROR] libusb installation failed"
    exit 1
fi

echo "=== libusb installation completed ==="
