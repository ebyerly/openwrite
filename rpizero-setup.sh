# Follow Raspberry Pi's recommended process for burning Raspbian Lite onto a
# microSD card:
# https://www.raspberrypi.com/documentation/computers/getting-started.html#using-raspberry-pi-imager

# Configure a headless installation and access the RPiZW using SSH:
# https://www.tomshardware.com/reviews/raspberry-pi-headless-setup-how-to,6028.html

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