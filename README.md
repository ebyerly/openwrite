# openwrite

DIY alternative to https://getfreewrite.com/ because I love the concept and the execution and can't justify the price.

### Requirements

* write text files
* manage (switch between, copy, delete) multiple text files
* store N kB of text files
* sync text files with Google Drive folder
* 4 hours of active typing time
* rechargeable
* mechanical keyboard
* able to see last N typed words
* able to see system state (turned on, current file, etc)
* NOT able to do my typical time wasters (email, reddit, twitter) in an enjoyable way
* cheap, given the above constraints

### Outline

* terminal-only linux
* raspberry pi zero W
* Raspbian Lite
* tiniest screen that's still legible
* rechargeable battery
* single PCB mount

### Notes

#### decisions

* [X] software: QMK, KiCAD, OpenSCAD
* [X] switches: Nuphy Wisteria / Gateron KS-33
* [X] computer: Raspberry Pi Zero W v1.1
* [X] microcontroller for keyboard control: Adafruit KB2040 (https://github.com/adafruit/Adafruit-KB2040-PCB, https://github.com/drewgates/kb2040-kicad)
* [X] keycap dimensions and gap: 19mm between lead centers (cap standard is ~18mm)
* [X] power management: Adafruit PowerBoost 1000C (overkill, but I already own it)
* [X] key layout: in flux, but 5x14 ortholinear to match Moonlander to start
* [X] display: Waveshare 2" display ($15, https://www.waveshare.com/2inch-lcd-module.htm)
* [X] USB switch: M2042LL2W03 (4pdt PCB mount toggle rated for 4A)
* [ ] keyboard USB header format
    * USB-C with 4 pole output? micro-USB? Would prefer usb-c, but want to confirm there's no risk of power delivery past what I design the board to receive
    * "All USB-C cables must be able to carry a minimum of 3 A current (at 20 V, 60 W)"

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
* https://github.com/sethhillbrand/kicad_templates - includes OSH Park 2 layer (apparently validated by their team!)

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
* Replace physical USB switch with an IC that detects when the onboard computer is powered on or not
