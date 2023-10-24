MAIN = main/esp32-vo.c

all: configure flash monitor

configure:
	idf.py set-target esp32

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