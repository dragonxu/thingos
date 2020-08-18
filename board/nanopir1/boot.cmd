fatload mmc 0 ${kernel_addr_r} zImage
fatload mmc 0 ${fdt_addr_r} sun8i-h3-nanopi-r1.dtb
fatload mmc 0 ${ramdisk_addr_r} uInitrd
fatload mmc 0 ${scriptaddr} uEnv.txt
env import -t ${scriptaddr} ${filesize}

setenv bootargs console=ttyS0,115200 earlyprintk root=${disk_dev}p2 rootwait ro no_console_suspend

if test "${initramfs_enabled}" = "1"; then
    bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}
else
    bootz ${kernel_addr_r} - ${fdt_addr_r}
fi
