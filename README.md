# ESP32 Vision Offloading
This project targets efficient image offloading from an ESP32 camera module to the edge server through Wi-Fi.

## TODOs
- [x] Use VSCode and ESP-IDF to create a basic ESP32 project.
- [x] Figure out the connection between ESP32 and the programmer.
- [x] Build, flash, and run a "hello world" project.
- [x] Create the "vision-offloading" project which reads images from the camera and prints out the image information (size).
- [ ] Test the "vision-offloading" for our custom-built ESP32 module.
  - Connection: (1, 2, 3, 4): (GND, TX, RX, 3V3). Please make sure you are using 3V3, not 5V.
  - Flashing: hold BOOT1, start flash, press RESET1 once, wait until flash ends, release BOOT1, press RESET1 once to start the firmware.
  - Camera connection:
      - Y2: GPIO5
      - Y3: GPIO3
      - Y4: GPIO2
      - Y5: GPIO4
      - Y6: GPIO6
      - PCLK: GPIO7
      - Y7: GPIO8
      - Y8: GPIO9
      - XVCLK: GPIO10
      - Y9: GPIO11
      - HREF: GPIO12
      - VSYNC: GPIO13
      - RESET: GPIO14
      - SIO_C: GPIO16
      - SIO_D: GPIO15
- [ ] Make the above tasks done quickly.
- [ ] Develop network application between ESP32 and edge server.
- [ ] Improve the efficiency of the image streaming.

For more information, please refer to the tutorial [here](tutorial.md).

## References

- Setting up ESP32 with VSCode and ESP-IDF [video](https://www.youtube.com/watch?v=6KKHgyapl-c) with [code](https://github.com/Tech-Inside/esp32/blob/master/camera/main/main.c)