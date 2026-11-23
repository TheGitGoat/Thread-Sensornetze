== Over-the-Air Packet Sniffing
=== Hardware vorbereiten
==== Firmware für Thread flashen
- EByte E104

Firmware und Wireshark Interface: https://github.com/nordicsemi/nRF-Sniffer-for-802.15.4

*USB-Gerät anschließen und prüfen*
```bash
[bash@linux]$ lsusb
...
Bus 001 Device 013: ID 1915:154b Nordic Semiconductor ASA nRF 802154 Sniffer
...
```
*Firmware Zip erzeugen*

```bash
[bash@linux]$ cd nrfsniffer/nRF-Sniffer-for-802.15.4
[bash@linux]$ nrfutil nrf5sdk-tools pkg generate \
              --hw-version 52 \
              --sd-req 0x00 \
              --application nrf802154_sniffer/nrf802154_sniffer_nrf52840dongle.hex \
              --application-version 1 \
              thread-sniffer.zip
```

*Erzeugtes Image inspizieren*

```bash
[bash@linux]$ nrfutil nrf5sdk-tools pkg display thread-sniffer.zip
DFU Package: <thread-sniffer.zip>:
|
|- Image count: 1
|
|- Image #0:
   |- Type: application
   |- Image file: nrf802154_sniffer_nrf52840dongle.bin
   |- Init packet file: nrf802154_sniffer_nrf52840dongle.dat
      |
      |- op_code: INIT
      |- signature_type: UNSIGNED
      |- signature (little-endian): N/A
      |
      |- fw_version: 0x00000001 (1)
      |- hw_version 0x00000034 (52)
      |- sd_req: 0x00
      |- type: APPLICATION
      |- sd_size: 0
      |- bl_size: 0
      |- app_size: 125740
      |
      |- hash_type: SHA256
      |- hash (little-endian): b'ec90d70475abdf47086d7eb1b85f9b30ccb3b74479182a7aff2e67c719fcc945'
      |
      |- boot_validation_type: ['VALIDATE_GENERATED_CRC']
      |- boot_validation_signature (little-endian): [b'']
      |
      |- is_debug: False
```

*Firmware auf EByte-E104 schreiben*
```bash
[bash@linux]$ nrfutil nrf5sdk-tools dfu usb-serial \
              --package thread-sniffer.zip \
              --port /dev/ttyACM0
```



*Installation verifizieren*
```bash
[bash@linux]$ dmesg | tail -10
...
[14280.802956] usb 1-2.1: new full-speed USB device number 14 using xhci_hcd
[14280.904178] usb 1-2.1: New USB device found, idVendor=1915, idProduct=154b, bcdDevice= 3.06
[14280.907422] usb 1-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[14280.907426] usb 1-2.1: Product: nRF 802154 Sniffer
[14280.907427] usb 1-2.1: Manufacturer: Nordic Semiconductor ASA
[14280.907428] usb 1-2.1: SerialNumber: 47ABCEB6D87114F6
[14280.917275] cdc_acm 1-2.1:1.0: ttyACM0: USB ACM device

```

-> nun ist Ebyte nRF802154 mit Nordic 802.15.4 Firmware

==== Wireshark Interface anbinden

!TODO





- Thread Schlüssel

