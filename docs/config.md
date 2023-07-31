# Configuration

## Web Configuration

Many functions of the SeaTAK can be controlled, configured and monitored via the SeaTAK 
Web page. When connecting directly to the SeaTAK in Hotspot mode (via SeaTAK-XXXX WiFi Network) you can access the SeaTAK Web page by visiting [http://seatak.local](http://seatak.local) from your Chrome or Safari web browser (Android & iOS) or in Edge, Chrome or Safari on you computer.

### Connect to WiFI

**N.B.**: If you are connected to SeaTAK via the WiFi Hospot (SeaTAK-XXXX), reconfiguring the WiFi to connect to another network will terminate your Hospot connection. To reach the SeaTAK Web page after this point, you'll need to connect to the same network as SeaTAK.

1. Connect to the SeaTAK WiFi network and browse to http://seatak.local
2. Click the WiFi configuration option.
3. Enter WiFi credentials and apply.

## Reset WiFi

TK

## Disable WiFi

TK

## Change TAK / CoT destination

TK

## Command-line Configuration

For advanced users. These steps require familiarity with command-line terminals using SSH. 

### Change default password

The SeaTAK OS image contains a user with a default password. It is recommended that the 
owner of SeaTAK gateway change this password.

To change the default password:

1. SSH into SeaTAK: ``ssh pi@seatak.local``
2. Change the password: ``passwd``

**Please make note of this password. There is no password recovery feature.**

See also: [Raspberry Pi Insecure first user](https://www.raspberrypi.com/news/raspberry-pi-bullseye-update-april-2022/)

### Change TAK / CoT Destination

By default, SeaTAK sends Cursor on Target messages to the ATAK Mesh SA multicast group & port: ``udp://239.2.3.1:6969`` (expressed as a read-only port via ``udp+wo://...``). 

To send CoT to a different destination, you'll need to SSH into SeaTAK and change the 
configuration for ``adsbcot``.

1. SSH into SeaTAK: ``ssh pi@seatak.local``
2. Edit adsbcot's configuration: ``sudo nano /boot/adsbcot-config.txt`` (N.B. This is *not* an INI-style file.)
3. Save & reboot.


### Change dump1090-fa & dump978-fa SDR serial numbers

SeaTAK comes with SDR serial numbers hard-coded for the SeaTAK v1 hardware kit. If 
you’re using the SeaTAK OS with other SDRs, you’ll need to change these hard-coded values.

#### Changing dump1090-fa SDR serial number

1. SSH into the SeaTAK: ``ssh pi@seatak.local``
2. List the serial numbers of the installed SDRs by typing the command: ``rtl_test``

![Example rtl_test output with 1 SDR.](https://images.squarespace-cdn.com/content/v1/6477cab5986c146297acea21/8d1ecb30-17f4-4225-a7c6-76eca789b645/Screen+Shot+2023-07-08+at+11.48.45+AM.png)

3. Using the Nano text editor, open the dump1090-fa configuration file: ``sudo nano /etc/default/dump1090-fa``

![dump1090-fa config line](https://images.squarespace-cdn.com/content/v1/6477cab5986c146297acea21/44e90a93-624d-404b-b758-24d55377e626/Screen+Shot+2023-07-08+at+11.49.44+AM.png)

4. Find the line beginning with RECEIVER_SERIAL and change the value to match the SN value from the rtl_test command above.

5. Reload and restart dump1090-fa:
``sudo systemctl daemon-reload``
``sudo systemctl restart dump1090-fa``

### Changing dump978-fa SDR serial number

1. SSH into the SeaTAK: ``ssh pi@seatak.local``
2. List the serial numbers of the installed SDRs by typing the command: ``rtl_test``
3. Using the Nano text editor, open the dump978-fa configuration file: 
``sudo nano /etc/default/dump978-fa``
4. Find the line beginning with TK TK
