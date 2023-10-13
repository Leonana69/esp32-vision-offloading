# How to Flash Firmware for ESP32
- Connect IO0 to GND.
- Start flashing and press the RESET button once.
- Example Makefile entry for flash:
```
flash:
	@usbport=$$(ls /dev/cu.usbserial-* | head -1); \
	if [ -z "$$usbport" ]; then \
		echo "No USB port found"; \
	else \
		idf.py -p $$usbport flash; \
	fi
```
- Wait until flashing is done, disconnect IO0, and push the RESET button again. The new firmware won't run until you RESET the chip.
