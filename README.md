## docker-lcd4linux

A dockerfile containing [lcd4linux](https://lcd4linux.bulix.org/) and [serdisplib](http://serdisplib.sourceforge.net/) for use with various LCD-displays.  

### Features

* lcd4linux-0.11 (build with python-plugin)
* serdisblib-2.01
* supports Alphacool LCD-displays

### Getting started

1. Attach your Display to the computer
2. Use _lsusb_ from _usbutils_-package to indentify the port your display uses. (Example: Alphacool-lcd has VENDOR-ID: **060c** and Device-ID: **04eb**)
```
$ lsusb |grep 060c:04eb
Bus 003 Device 006: ID 060c:04eb EEH Datalink GmbH 
```
3. Ok, our lcd is on Bus 003 Device 006. Edit last line in in _docker-compose.yml_-file to reflect your bus and device numbers.
```
$ vi docker-compose.yml
version: '3'
services:

  driver:
    image: kaergel/lcd4linux
    volumes:
      - ./lcd4linux.conf:/lcd4linux.conf
      - ./get_measuring_value.py:/get_measuring_value.py
      - /etc/hostname:/etc/sysname
    restart: always
    environment:
      - PYTHONPACKAGES="py-cpuinfo"
    devices:
      - "/dev/bus/usb/003/006:/dev/bus/usb/003/006"
```
4. Edit _lcd4linux.conf_-file to reflect your display and adapt your lcd screen layout.
```
$ vi lcd4linux.conf
...
Display SerDispLib {
    Driver 'serdisplib'
    Port 'USB:060C/04EB'
    Model 'ALPHACOOL'
    Font       '6x8'
    Backlight  '1'
    Rotate     '0'
    Options ''
}
...
```
5. Start the container
```# docker-compose up -d``` 
