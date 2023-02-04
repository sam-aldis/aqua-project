#!/bin/bash
pkg upgrade && \
    pkg install axel qemu-system-x86-64-headless qemu-utils ||  exit 1
read -p "[nix/alpine]?" QDOCKER_DISTRO
if [[ "${QDOCKER_DISTRO}" == "alpine" ]]; then
    echo $QDOCKER_DISTRO
    read && axel "https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/alpine-virt-3.17.1-x86_64.iso" -o "${QDOCKER_DISTRO}.iso"   
fi
if [[ "${QDOCKER_DISTRO}" == "nix" ]]; then
    echo $QDOCKER_DISTRO
    read &&  axel "https://channels.nixos.org/nixos-22.11/latest-nixos-minimal-x86_64-linux.iso" -o "${QDOCKER_DISTRO}.iso"   
fi


qemu-img create -f qcow2 ${QDOCKER_DISTRO}.qcow2 6G

echo "already to start ${QDOCKER_DISTRO} please press return..." && read
./boot.sh
