#!/bin/sh
# reference: http://wiki.ecg.rice.edu/doku.php?id=xzl:tutorial:arm_qemu
qemu-system-arm -kernel uImage -M vexpress-a9 -cpu cortex-a9 \
-m 1024 -initrd initrd \
-append 'root=/dev/mmcblk0p2 rw mem=1024M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0' \
-drive file=vexpress-a9-nano.img,if=sd,cache=writeback  \
-serial stdio
# -display vnc=localhost:17
# -net user -net nic,macaddr=52:54:00:fa:ce:13 \

