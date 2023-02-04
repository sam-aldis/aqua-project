#!/bin/bash
read -p "[nix/alpine]?" QDOCKER_DISTRO
qemu-system-x86_64 -smp 2 -m 2048 -drive file=${QDOCKER_DISTRO}.qcow2,if=virtio \
   -netdev user,id=n1,hostfwd=tcp::6379-:6379,hostfwd=tcp::9000-:9000 \
   -device virtio-net,netdev=n1 \
   -nographic
