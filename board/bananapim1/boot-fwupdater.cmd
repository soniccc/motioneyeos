setenv bootargs console=tty1 root=/dev/mmcblk0p2 rootwait panic=10 earlyprintk quiet loglevel=1 ${extra}
setenv fdt_high ffffffff
setenv video-mode sunxi:1024x768-24@60,monitor=hdmi,hpd=1,edid=1
fatload mmc 0 0x41000000 uImage
fatload mmc 0 0x43000000 sun7i-a20-bananapi.dtb
fatload mmc 0 0x45000000 uInitrd
bootm 0x41000000 0x45000000 0x43000000

