cd ~/ECE695_OS/OS_repo_bb/prog2


# For OS add the pre-compiled qemu to your path
export PATH=/home/dynamo/a/xzl/ece695/pub/qemu-2.0.0/install/bin:$PATH

unset LD_LIBRARY_PATH
unset PKD_CONFIG_PATH
export EPREFIX="/home/dynamo/a/xzl/gentoo"
export PATH="$EPREFIX/usr/bin:$EPREFIX/bin":$PATH

export LD_LIBRARY_PATH=/home/dynamo/a/xzl/ece695/pub/lib

# for userspace and linux
export PATH=/home/dynamo/a/xzl/ece695/pub/linaro-arm-linux-gnueabi-2012.02/bin:$PATH
# for xv6
export PATH=/home/dynamo/a/xzl/ece695/pub/arm-2012.03/bin:$PATH
