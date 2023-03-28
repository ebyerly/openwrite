#### decisions

* [X] software: QMK, OpenSCAD, KiCAD
* [X] switches: Nuphy Wisteria / Gateron KS-33
* [X] computer: Raspberry Pi Zero W v1.1
* [X] microcontroller for keyboard control: Adafruit KB2040 (https://github.com/adafruit/Adafruit-KB2040-PCB, https://github.com/drewgates/kb2040-kicad)
* [X] keycap dimensions and gap: 19mm between lead centers (cap standard is ~18mm)
* [X] power management: Adafruit PowerBoost 1000C (overkill, but I already own it)
* [X] key layout: in flux, but 5x14 ortholinear to match Moonlander to start
* [X] display - Waveshare 2" display ($15, https://www.waveshare.com/2inch-lcd-module.htm)
* [ ] USB switch
    * M2042TNW01-DA - 4pdt rated for 4A
    * 50209LX - 3pdt rated for 1A
    * ANT33FAR2S25RE - 3PDT 5A 120V
* [ ] keyboard USB format
    * USB-C with 4 pole output? micro-USB? Would prefer usb-c, but want to confirm there's no risk of attempted power delivery beyond what the board can handle (does usb-c charging default low and only exceed usb 2* standard after a handshake...?)

#### parts links / proto bill of materials

* Raspberry Pi Zero W (10.00, https://www.adafruit.com/product/3400)
* PowerBoost 1000 Charger - Rechargeable 5V Lipo USB Boost @ 1A - 1000C (19.95, https://www.adafruit.com/product/2465)
* Lithium Ion Battery - 3.7v 2000mAh (12.50, https://www.adafruit.com/product/2011)
* Micro SD 16GB (5.79, https://www.amazon.com/SanDisk%C2%AE-microSDHCTM-8GB-Memory-Card/dp/B001T9CU40)
* Breadboard-friendly SPDT Slide Switch (0.95, https://www.adafruit.com/product/805)

#### reference projects

* through-hole pcb-mounted-microcontroller usb-c keyboard (discipline): https://github.com/coseyfannitutti/discipline
* through-hole pcb-mounted-microcontroller usb-c keyboard (framework): https://github.com/stevennguyen/framework
* mini computer with custom keyboard (penkesu): https://github.com/penk/penkesu
* system76 launch keyboard with integrated USB hub: https://github.com/system76/launch
* Env-KB, a Raspberry Pi Pico keyboard: https://github.com/Envious-Data/Env-KB
* cyberdetox rpi400 mod: https://www.reddit.com/r/cyberDeck/comments/11tzifa/new_cyberdetox_displat_for_raspberry_pi_400/
* GreatScott DIY charge/boost: https://www.youtube.com/watch?v=Fj0XuYiE7HU, https://www.instructables.com/DIY-LiPo-ChargeProtect5V-Boost-Circuit/

#### kicad

* intro to kicad by hymel/digikey: https://www.youtube.com/playlist?list=PL3bNyZYHcRSUhUXUt51W6nKvxx2ORvUQB
* getting to blink 5.0 by conceptual electronics: https://www.youtube.com/playlist?list=PLy2022BX6EspFAKBCgRuEuzapuz_4aJCn
* schematic simulation / SPICE integration: https://www.kicad.org/discover/spice/
* visually interesting circuit simulator with lots of examples: https://www.falstad.com/circuit/circuitjs.html
* https://blog.oshpark.com/2020/10/08/kicad-3d-viewer-can-now-render-after-dark/

##### pcb templates

* https://github.com/sethhillbrand/kicad_templates - includes OSH Park 2 layer (apparently validated by their team!)

#### raspberry pi zero W

Setup OS on micro SD card:

```sh
wget https://github.com/balena-io/etcher/releases/download/v1.5.70/balena-etcher-electron-1.5.70-linux-x64.zip
# Etcher dependency; it throws an error otherwise
sudo apt-get install libnss3
# Run Etcher - opens a GUI utility
./balenaEtcher-1.5.70-x64.AppImage
# Download Raspbian Lite
# Following https://www.losant.com/blog/getting-started-with-the-raspberry-pi-zero-w-without-a-monitor
wget http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-09-30/2019-09-26-raspbian-buster-lite.zip
# Use Etcher to burn onto microSD card
# Plug into zeroW, power on, give a minute to boot
# Find the IP address of the zero on your local network
ssh pi@<local IP address>
# Default password is "raspberry"
# Next following https://learn.adafruit.com/adafruit-2-2-pitft-hat-320-240-primary-display-for-raspberry-pi/easy-install


# TODO: fix up the Waveshare installation script
# https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/blob/main/adafruit-pitft.py
# `sudo raspi-config` to enable SPI (can do through config?)
# "Install BCM2835 libraries" - why?
sudo apt-get install cmake -y
cd ~
wget https://www.waveshare.com/w/upload/1/18/Waveshare_fbcp.zip
unzip Waveshare_fbcp.zip
cd Waveshare_fbcp/
sudo chmod +x ./shell/*
if [ -d "/home/elizabeth/Waveshare_fbcp/build" ]; then
    sudo rm -rf /home/elizabeth/Waveshare_fbcp/build
fi
mkdir /home/elizabeth/Waveshare_fbcp/build
sudo apt-get update
sudo apt-get install cmake -y
sudo apt-get install p7zip-full -y
sudo cp /home/elizabeth/Waveshare_fbcp/shell/boot/waveshare-2inch.txt /boot/config.txt
sudo cp /home/elizabeth/Waveshare_fbcp/shell/etc/rc.local /etc/rc.local
cd /home/elizabeth/Waveshare_fbcp/build
sudo cmake -DSPI_BUS_CLOCK_DIVISOR=20 -DWAVESHARE_2INCH_LCD=ON -DBACKLIGHT_CONTROL=ON -DSTATISTICS=0 ..
sudo make -j
if [ -x "/usr/local/bin/fbcp" ]; then
  sudo rm -rf /usr/local/bin/fbcp
fi
sudo cp ./fbcp /usr/local/bin/fbcp

echo "The system is configured."
echo "The system will restart."
sudo reboot
```

#### random

* "A simple guide to electronics components" - https://www.youtube.com/watch?v=6Maq5IyHSuc
* https://datasheets.raspberrypi.com/rp2040/hardware-design-with-rp2040.pdf
* microcontroller socketing: https://docs.splitkb.com/hc/en-us/articles/360011263059-How-do-I-socket-a-microcontroller-
* https://www.youtube.com/watch?v=ezk02GJ9iMs
* https://ergogen.cache.works/
* https://wiki.ai03.com/books/pcb-design/page/pcb-guide-part-1---preparations
* https://learn.adafruit.com/pigrrl-zero - guide to create a Pi Zero powered gaming device, includes step-by-step on connecting battery and display.
* http://i.imgur.com/ZQHDGTV.jpg
* https://sudomod.com/forum/viewtopic.php?t=2666
* https://cdn.sparkfun.com/assets/learn_tutorials/6/7/6/PiZero_1.pdf
* https://www.neverstopbuilding.com/blog/wiring-micro-usb-pinout
* https://en.wikipedia.org/wiki/USB
* https://desertbot.io/blog/headless-pi-zero-w-wifi-setup-windows
* OpenSCAD libraries/models:
  - https://github.com/revarbat/BOSL
  - https://www.thingiverse.com/thing:1638529
  - https://www.thingiverse.com/thing:2186550
* Part dimension sources
  - https://learn.adafruit.com/adafruit-2-2-pitft-hat-320-240-primary-display-for-raspberry-pi/downloads
  - https://learn.adafruit.com/adafruit-powerboost-1000c-load-share-usb-charge-boost/downloads
  - https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/rpi_MECH_Zero_1p3.pdf

#### iterations

* charge/boost/buck functionality directly on the board (replace the Powerboost 1000C)
* Keyboard microcontroller directly on the board (replace the KB2040)
* integrated touchpad (https://www.cirque.com/glidepoint-circle-trackpads)
* microcontroller-powered text editor (move closer to alphasmart)
* RPiZ supports HDMI output / hot-swap boot micro-SD with regular RaspbianOS (move closer to a portable work station)
* E-ink screen
