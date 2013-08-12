1. SETUP

a. disable serial port login

$ sudo vi /etc/inittab

# comment out the last line:
T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100

# to:
#T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100

b. disable bootup info

$ sudo vi /boot/cmdline.txt

# edit following line:
dwc_otg.lpm_enable=0 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait

# to:
dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait

c. add user to group dialout

$ sudo usermod $USER -a -G dialout

d. reboot

$ sudo shutdown -r now

2. INSTALL

$ gem install pilite
