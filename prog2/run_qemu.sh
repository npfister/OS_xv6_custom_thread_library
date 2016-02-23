#! /bin/bash
#qemu-system-arm -kernel uImage -M vexpress-a9 -cpu cortex-a9 -m 1024 -initrd initrd -append 'root=/dev/mmcblk0p2 rw mem=1024M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0' -sd vexpress-a9-nano.img -serial stdio

# Trying provided uImage with myinitrd - works
#cd vexpress
#qemu-system-arm -kernel ../vexpress/uImage -M vexpress-a9 -cpu cortex-a9 -m 1024 -initrd ../kernel/linux-linaro-stable-3.10.62-2014.12/tmp/my-initrd -append 'root=/dev/mmcblk0p2 rw mem=1024M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0' -sd vexpress-a9-nano.img -serial stdio


# Running compiled zImage with myinitrd
if [[ $1 == 'run' ]]; then
    cd ~/ECE695_OS/OS_repo_bb/prog2/vexpress
    qemu-system-arm \
	-kernel ../kernel/linux-linaro-stable-3.10.62-2014.12/arch/arm/boot/zImage \
	-M vexpress-a9 \
	-cpu cortex-a9 \
	-m 1024 \
	-initrd ../kernel/linux-linaro-stable-3.10.62-2014.12/tmp/my-initrd \
	-append 'root=/dev/mmcblk0p2 rw mem=1024M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0' \
	-sd vexpress-a9-nano.img \
	-serial stdio \
	--display none


elif [[ $1 == 'rungdb' ]]; then
    cd ~/ECE695_OS/OS_repo_bb/prog2/vexpress
    qemu-system-arm -S \
	-gdb tcp::1236 \
	-kernel ../kernel/linux-linaro-stable-3.10.62-2014.12/arch/arm/boot/zImage \
	-M vexpress-a9 \
	-cpu cortex-a9 \
	-m 1024 \
	-initrd ../kernel/linux-linaro-stable-3.10.62-2014.12/tmp/my-initrd \
	-append 'root=/dev/mmcblk0p2 rw mem=1024M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=256MB devtmpfs.mount=0' \
	-sd vexpress-a9-nano.img \
	-serial stdio \
	#--display=none


elif [[ $1 == 'compile' ]]; then
    cd ~/ECE695_OS/OS_repo_bb/prog2/kernel/linux-linaro-stable-3.10.62-2014.12
    export ARCH=arm
    export CROSS_COMPILE=arm-linux-gnueabi-
    make -j`getconf _NPROCESSORS_ONLN`


else
    echo "Error. Use arg: {run, compile, rungdb}."

fi

# Trying various mem sizes
#qemu-system-arm -kernel ../kernel/linux-linaro-stable-3.10.62-2014.12/arch/arm/boot/zImage -M vexpress-a9 -cpu cortex-a9 -m 8 -initrd ../kernel/linux-linaro-stable-3.10.62-2014.12/tmp/my-initrd -append 'root=/dev/mmcblk0p2 rw mem=32M raid=noautodetect console=ttyAMA0,38400n8 rootwait vmalloc=8MB devtmpfs.mount=0' -sd vexpress-a9-nano.img -serial stdio -display none
