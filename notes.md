#### reference projects

* through-hole pcb-mounted-microcontroller usb-c keyboard (discipline): https://github.com/coseyfannitutti/discipline
* through-hole pcb-mounted-microcontroller usb-c keyboard (framework): https://github.com/stevennguyen/framework
* mini computer with custom keyboard (penkesu): https://github.com/penk/penkesu

#### decisions

* [X] software: QMK, OpenSCAD, KiCAD
* [X] switches (defines stems and keycaps): Nuphy Wisteria, aka Gateron KS-33
* [X] computer: Raspberry Pi Zero W v1.1
* [ ] key layout
    * http://www.keyboard-layout-editor.com/
    * see keyboard-layout.json for current thought (mapped from Moonlander configuration)
* [ ] keycap dimensions and gap
    * 1mm gap is ~standard? what does Moonlander use?
* [ ] microcontroller for keyboard control
    * breakout board or raw?
    * needs to pair with a socket
* [ ] display
    * reference for display configurations supported by Adafruit: https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/blob/main/adafruit-pitft.py
    * Waveshare 2" display ($15, https://www.waveshare.com/2inch-lcd-module.htm)
    * Adafruit PiTFT 2.2" HAT Mini Kit - 320x240 2.2" TFT - No Touch (24.95, https://www.adafruit.com/product/2315)
* [ ] USB switch
    * 4pdt - why isn't this generally recommended?
* [ ] keyboard USB format
    * USB-C with 4 pole output? micro-USB?

#### parts links / proto bill of materials

* Raspberry Pi Zero W (10.00, https://www.adafruit.com/product/3400)
* PowerBoost 1000 Charger - Rechargeable 5V Lipo USB Boost @ 1A - 1000C (19.95, https://www.adafruit.com/product/2465)
* Lithium Ion Battery - 3.7v 2000mAh (12.50, https://www.adafruit.com/product/2011)
* Magicforce 68 (39.98, https://www.amazon.com/Qisan-Mechanical-Keyboard-68-Keys-Magicforce/dp/B01E8KO2B0)
* Micro SD 16GB (5.79, https://www.amazon.com/SanDisk%C2%AE-microSDHCTM-8GB-Memory-Card/dp/B001T9CU40)
* USB DIY Slim Connector Shell - MicroB Plug (2 x 0.95, https://www.adafruit.com/product/1826)
* Breadboard-friendly SPDT Slide Switch (0.95, https://www.adafruit.com/product/805)


#### random

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

#### kicad

* intro to kicad by hymel/digikey: https://www.youtube.com/playlist?list=PL3bNyZYHcRSUhUXUt51W6nKvxx2ORvUQB
* getting to blink 5.0 by conceptual electronics: https://www.youtube.com/playlist?list=PLy2022BX6EspFAKBCgRuEuzapuz_4aJCn
* schematic simulation / SPICE integration: https://www.kicad.org/discover/spice/

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
```
