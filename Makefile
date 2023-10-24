MAIN = main/esp32-vo.c

all: flash monitor

config:
	idf.py menuconfig

build: $(MAIN)
	idf.py build

flash: $(MAIN)
	@usbport=$$(ls /dev/cu.usbserial-* | head -1); \
	if [ -z "$$usbport" ]; then \
		echo "No USB port found"; \
	else \
		idf.py -p $$usbport flash; \
	fi

monitor:
	@usbport=$$(ls /dev/cu.usbserial-* | head -1); \
	if [ -z "$$usbport" ]; then \
		echo "No USB port found"; \
	else \
		idf.py -p $$usbport monitor; \
	fi

clean:
	idf.py clean