# openwrite

### Requirements

- write text files
- manage (switch between, copy, delete) multiple text files
- store N kB of text files
- sync text files with Google Drive folder
- 4 hours of active typing time
- rechargeable
- mechanical keyboard
- able to see last N typed words
- able to see system state (turned on, current file, etc)
- NOT able to do my typical time wasters (email, reddit, twitter) in an enjoyable way
- cheap, given the above constraints



### Non-requirements

- Ability to function as standalone keyboard
- External connection ports for anything other than charging
- Quick swap of SD card



### Proposed design

- terminal-only linux
- off-the-shelf mechanical keyboard
- raspberry pi zero W
- Raspbian Lite
- tiniest screen that's still legible
- rechargeable battery
- positional hinges
- 3d printed case



### Parts list

- Raspberry Pi Zero W (10.00, https://www.adafruit.com/product/3400)
- PowerBoost 1000 Charger - Rechargeable 5V Lipo USB Boost @ 1A - 1000C (19.95, https://www.adafruit.com/product/2465)
- Lithium Ion Battery - 3.7v 2000mAh (12.50, https://www.adafruit.com/product/2011)
- Adafruit PiTFT 2.2" HAT Mini Kit - 320x240 2.2" TFT - No Touch (24.95, https://www.adafruit.com/product/2315)
- Magicforce 68 (39.98, https://www.amazon.com/Qisan-Mechanical-Keyboard-68-Keys-Magicforce/dp/B01E8KO2B0)
- Micro SD 16GB (5.79, https://www.amazon.com/SanDisk%C2%AE-microSDHCTM-8GB-Memory-Card/dp/B001T9CU40)
- USB DIY Slim Connector Shell - MicroB Plug (2 x 0.95, https://www.adafruit.com/product/1826)
- Breadboard-friendly SPDT Slide Switch (0.95, https://www.adafruit.com/product/805)



### References

- https://learn.adafruit.com/pigrrl-zero - guide to create a Pi Zero powered gaming device, includes step-by-step on connecting battery and display.
- 


### Magicforce 68 dimensions

- length: 104 mm
- width: 337 mm
- bezel: 9mm



### OS notes

(run on linux to setup SD card OS)

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


### Notes


- [http://i.imgur.com/ZQHDGTV.jpg]
- https://sudomod.com/forum/viewtopic.php?t=2666
- https://cdn.sparkfun.com/assets/learn_tutorials/6/7/6/PiZero_1.pdf
- https://www.neverstopbuilding.com/blog/wiring-micro-usb-pinout
- https://en.wikipedia.org/wiki/USB
- https://desertbot.io/blog/headless-pi-zero-w-wifi-setup-windows
- OpenSCAD libraries/models:
  - https://github.com/revarbat/BOSL
  - https://www.thingiverse.com/thing:1638529
  - https://www.thingiverse.com/thing:2186550
- Part dimension sources
  - https://learn.adafruit.com/adafruit-2-2-pitft-hat-320-240-primary-display-for-raspberry-pi/downloads
  - https://learn.adafruit.com/adafruit-powerboost-1000c-load-share-usb-charge-boost/downloads
  - https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/rpi_MECH_Zero_1p3.pdf
