# PiLITE-rb

![Gem Version](http://img.shields.io/gem/v/pilite.svg)

For controlling Pi-LITE board on Raspberry Pi with Ruby or Rails.

Pi-LITE is a 14x9 LED control board that can be found here:
http://shop.ciseco.co.uk/pi-lite-lots-of-leds-for-the-raspberry-pi-0805-red/

## 1. Setup

### a. disable serial port login

`$ sudo vi /etc/inittab`

comment out the last line from:
```
T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100
```

to:
```
#T0:23:respawn:/sbin/getty -L ttyAMA0 115200 vt100
```

### b. disable bootup info

`$ sudo vi /boot/cmdline.txt`

edit following line:
```
dwc_otg.lpm_enable=0 console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait
```

to:
```
dwc_otg.lpm_enable=0 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline rootwait
```

### c. Add user to group dialout

`$ sudo usermod $USER -a -G dialout`

### d. Reboot

`$ sudo shutdown -r now`

## 2. Install pilite

`$ gem install pilite`

## 3. Run

`$ pilite help`

or

```ruby
require 'pilite'

PiLite::Commands.start{|lite|
  lite.all :on
  sleep 1 
  lite.all :off
}
```

## 4. TODOs

- add some test scripts

