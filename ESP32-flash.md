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