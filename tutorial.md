# EPS-IDF for EPS32-CAM Tutorial

Source: [vscode-esp-idf-extension](https://github.com/espressif/vscode-esp-idf-extension/blob/HEAD/docs/tutorial/basic_use.md)

## Set up EPS-IDF

1. Install Espressif-IDF (ESP_IDF) using [these instructions](https://github.com/espressif/vscode-esp-idf-extension/blob/6becb8ef795b3e257e25b1628562f1219430094b/docs/tutorial/install.md)

    For **`Select ESP-IDF version`**, choose `v5.1-rc2 (release version)` as the version to install

1. Clone [esp32-camera](https://github.com/espressif/esp32-camera.git) repository in the `<path/to/ESP-IDF/container/directory>esp/esp-idf/components` folder

    The path to the `esp-idf` folder is the same path you used in [Step 10](https://github.com/espressif/vscode-esp-idf-extension/blob/6becb8ef795b3e257e25b1628562f1219430094b/docs/tutorial/install.md?plain=1#L30) in the instuctions above

    ```bash
    cd ~/esp/esp-idf/components # or wherever you installed ESP-IDF
    git clone https://github.com/espressif/esp32-camera.git
    ```

## Configure, Build, Flash, and Run an EPS-IDF Project for EPS32-CAM

1. Open the project folder in VSCode

### Configure

1. Select `esp32` as the Espressif target (`esp32`, `esp32s2`, etc.) with the **`ESP-IDF: Set Espressif device target`** command

    First, for "Pick Workspace Folder to which settings should be applied", select the project folder
    
    Then, select `esp32`. This will show a list of ESP32 variants. Just hit `Esc` to close the options
    
    You should see a new generated file in the project root folder named `sdkconfig`

1. Run `make config`

    Using your arrow keys in the GUI, set the following options:

    - `Component config` &rarr; `ESP PSRAM` &rarr; Enable `Support for external, SPI-connected RAM`
    - `Component config` &rarr; `ESP PSRAM` &rarr; `Support for external, SPI-connected RAM` &rarr; `SPI RAM config` &rarr; `Set RAM clock speed` &rarr; Set `80MHz Clock Speed`
    - `Serial flasher config` &rarr; `Flash SPI speed` &rarr; Set `80 MHz`
    - `WIFI` &rarr; Enter correct `SSID`
    - `WIFI` &rarr; Enter correct `Password`

    Press `Q` to quit.

    A prompt will ask you if you want to save the configuration to `.../esp32-vision-offloading/sdkconfig`. Press `Y` to save.

### Build

1. Build the project by running `make build`

    <details>
    <summary>Example of successful build output</summary>

    ```
    idf.py build
    /Users/joshua/esp/esp-idf/tools/check_python_dependencies.py:12: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
    import pkg_resources
    Executing action: all (aliases: build)
    Running ninja in directory /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build
    Executing "ninja all"...
    [0/1] Re-running CMake...-- Building ESP-IDF components for target esp32
    Processing 1 dependencies:
    [1/1] idf (5.1.0)-- Project sdkconfig file /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/sdkconfig
    Compiler supported targets: xtensa-esp32-elf

    -- App "esp32-vo" version: 39ca9e5-dirty
    -- Adding linker script /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp-idf/esp_system/ld/memory.ld
    .
    .
    .
    -- Components: app_trace app_update bootloader ...
    -- Component paths: /Users/joshua/esp/esp-idf/components/app_trace /Users/joshua/esp/esp-idf/components/app_update /Users/joshua/esp/esp-idf/components/bootloader ...
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build
    [3/916] Generating ../../partition_table/partition-table.binPartition table binary generated. Contents:
    *******************************************************************************
    # ESP-IDF Partition Table
    # Name, Type, SubType, Offset, Size, Flags
    nvs,data,nvs,0x9000,24K,
    phy_init,data,phy,0xf000,4K,
    factory,app,factory,0x10000,1M,
    *******************************************************************************
    [378/916] Performing configure step for 'bootloader'-- Building ESP-IDF components for target esp32
    -- Project sdkconfig file /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/sdkconfig
    Compiler supported targets: xtensa-esp32-elf

    -- Adding linker script /Users/joshua/esp/esp-idf/components/soc/esp32/ld/esp32.peripherals.ld
    -- App "bootloader" version: v5.1-rc2-dirty
    -- Adding linker script /Users/joshua/esp/esp-idf/components/esp_rom/esp32/ld/esp32.rom.ld
    .
    .
    .
    -- Components: bootloader bootloader_support efuse ...
    -- Component paths: /Users/joshua/esp/esp-idf/components/bootloader /Users/joshua/esp/esp-idf/components/bootloader_support /Users/joshua/esp/esp-idf/components/efuse ...
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader
    [2/3] Generating binary image from built executableesptool.py v4.7.dev2
    Creating esp32 image...
    Merged 1 ELF section
    Successfully created esp32 image.
    Generated /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader/bootloader.bin
    [3/3] cd /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader/esp-idf/esptool_py && /...bootloader 0x1000 /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader/bootloader.binBootloader binary size 0x6820 bytes. 0x7e0 bytes (7%) free.
    [915/916] Generating binary image from built executableesptool.py v4.7.dev2
    Creating esp32 image...
    Merged 2 ELF sections
    Successfully created esp32 image.
    Generated /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp32-vo.bin
    [916/916] cd /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp-idf/esptool_py && /Users/j...tion_table/partition-table.bin /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp32-vo.binesp32-vo.bin binary size 0x4dfd0 bytes. Smallest app partition is 0x100000 bytes. 0xb2030 bytes (70%) free.

    Project build complete. To flash, run this command:
    /Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python ../../../../../esp/esp-idf/components/esptool_py/esptool/esptool.py -p (PORT) -b 460800 --before default_reset --after hard_reset --chip esp32  write_flash --flash_mode dio --flash_size 2MB --flash_freq 80m 0x1000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 build/esp32-vo.bin
    or run 'idf.py -p (PORT) flash'
    ```
    </details>

### Flash

1. Connect the ESP32-CAM to a UART to USB converter using the following pins:

    - Converter `GND` to ESP32-CAM `GND`
    - Converter `5V` to Converter `VCC`
    - Converter `VCC` to ESP32-CAM `5V`
    - Converter `TX` to ESP32-CAM `U0R`
    - Converter `RX` to ESP32-CAM `U0T`
    - ESP32-CAM `IO0` to ESP32-CAM `GND` (this is to put the ESP32-CAM in flash mode)

1. Connect the UART to USB converter to your computer via USB

1. Select the serial port of the device with the **`ESP-IDF: Select port to use`** command (e.g. `/dev/cu.usbserial-A50285BI`)

1. Flash and monitor the project to the ESP32-CAM by running `make`

    <details>
    <summary>Example of successful initial flash output</summary>

    ```
    (base) joshua@delta-2 esp32-vision-offloading % make flash
    /Users/joshua/esp/esp-idf/tools/check_python_dependencies.py:12: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
    import pkg_resources
    Executing action: flash
    Running ninja in directory /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build
    Executing "ninja flash"...
    [1/5] cd /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp-idf/esptool_py && /Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python /Users/joshua/esp/esp-idf/components/partition_table/check_sizes.py --offset 0x8000 partition --type app /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/partition_table/partition-table.bin /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp32-vo.bin
    esp32-vo.bin binary size 0x4dfd0 bytes. Smallest app partition is 0x100000 bytes. 0xb2030 bytes (70%) free.
    [2/5] Performing build step for 'bootloader'
    [1/1] cd /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader/esp-idf/esptool_py && /Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python /Users/joshua/esp/esp-idf/components/partition_table/check_sizes.py --offset 0x8000 bootloader 0x1000 /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/bootloader/bootloader.bin
    Bootloader binary size 0x6820 bytes. 0x7e0 bytes (7%) free.
    [2/3] cd /Users/joshua/esp/esp-idf/components/esptool_py && /Users/joshua/.espressif/tools/cmake/3.24.0/CMake.app/Contents/bin/cmake -D IDF_PATH=/Users/joshua/esp/esp-idf -D "SERIAL_TOOL=/Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python;;/Users/joshua/esp/esp-idf/components/esptool_py/esptool/esptool.py;--chip;esp32" -D "SERIAL_TOOL_ARGS=--before=default_reset;--after=hard_reset;write_flash;@flash_args" -D WORKING_DIRECTORY=/Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build -P /Users/joshua/esp/esp-idf/components/esptool_py/run_serial_tool.cmake
    esptool.py --chip esp32 -p /dev/cu.usbserial-A50285BI -b 460800 --before=default_reset --after=hard_reset write_flash --flash_mode dio --flash_freq 80m --flash_size 2MB 0x1000 bootloader/bootloader.bin 0x10000 esp32-vo.bin 0x8000 partition_table/partition-table.bin
    esptool.py v4.7.dev2
    Serial port /dev/cu.usbserial-A50285BI
    ```
    </details>

    If the output prints out the following and hangs:

    ```
    .
    .
    .
    esptool.py v4.7.dev2
    Serial port /dev/cu.usbserial-A50285BI
    ```

    Then, make sure to press the `RST` button on the ESP32-CAM to reset the board.

    Now, it should connect and write to the board.

    <details>
    <summary>Example of successful final flash output</summary>

    ```
    Connecting.............................
    Chip is ESP32-D0WD-V3 (revision v3.1)
    Features: WiFi, BT, Dual Core, 240MHz, VRef calibration in efuse, Coding Scheme None
    Crystal is 40MHz
    MAC: a0:b7:65:50:de:a8
    Uploading stub...
    Running stub...
    Stub running...
    Changing baud rate to 460800
    Changed.
    Configuring flash size...
    Flash will be erased from 0x00001000 to 0x00007fff...
    Flash will be erased from 0x00010000 to 0x0005dfff...
    Flash will be erased from 0x00008000 to 0x00008fff...
    Compressed 26656 bytes to 16666...
    Writing at 0x00001000... (50 %)
    Writing at 0x000076b5... (100 %)
    Wrote 26656 bytes (16666 compressed) at 0x00001000 in 0.9 seconds (effective 238.2 kbit/s)...
    Hash of data verified.
    Compressed 319440 bytes to 167234...
    Writing at 0x00010000... (9 %)
    .
    .
    .
    Writing at 0x0005ca22... (100 %)
    Wrote 319440 bytes (167234 compressed) at 0x00010000 in 4.2 seconds (effective 603.6 kbit/s)...
    Hash of data verified.
    Compressed 3072 bytes to 103...
    Writing at 0x00008000... (100 %)
    Wrote 3072 bytes (103 compressed) at 0x00008000 in 0.1 seconds (effective 309.5 kbit/s)...
    Hash of data verified.

    Leaving...
    Hard resetting via RTS pin...
    Done
    /Users/joshua/esp/esp-idf/tools/check_python_dependencies.py:12: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html
      import pkg_resources
    Executing action: monitor
    Running idf_monitor in directory /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading
    Executing "/Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python /Users/joshua/esp/esp-idf/tools/idf_monitor.py -p /dev/cu.usbserial-A50285BI -b 115200 --toolchain-prefix xtensa-esp32-elf- --target esp32 --revision 0 /Users/joshua/_yale/academics/23fall/CPSC429/esp32-vision-offloading/build/esp32-vo.elf -m '/Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python' '/Users/joshua/esp/esp-idf/tools/idf.py' '-p' '/dev/cu.usbserial-A50285BI'"...
    --- esp-idf-monitor 1.3.2 on /dev/cu.usbserial-A50285BI 115200 ---
    --- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
    ```
    </details>

### Run

1. Monitor the project

    Running `make` in the previous step should have started the monitor automatically after flashing

    ```
    .
    .
    .
    --- esp-idf-monitor 1.3.2 on /dev/cu.usbserial-A50285BI 115200 ---
    --- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
    ```

1.  Disconnect the connection from ESP32-CAM `IO0` to ESP32-CAM `GND` to put the ESP32-CAM in run mode

1. Reset the ESP32-CAM by pressing the `RST` button on the board which should cause the ESP32-CAM to start running the project

    <details>
    <summary>Example of successful run output</summary>

    ```
    ets Jul 29 2019 12:21:46

    rst:0x1 (POWERON_RESET),boot:0x13 (SPI_FAST_FLASH_BOOT)
    configsip: 0, SPIWP:0xee
    clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
    mode:DIO, clock div:1
    load:0x3fff0030,len:7088
    load:0x40078000,len:15592
    load:0x40080400,len:4
    0x40080400: _init at ??:?

    ho 8 tail 4 room 4
    load:0x40080404,len:3876
    entry 0x4008064c
    I (31) boot: ESP-IDF v5.1-rc2-dirty 2nd stage bootloader
    I (31) boot: compile time Nov 10 2023 17:14:58
    I (31) boot: Multicore bootloader
    I (36) boot: chip revision: v3.1
    I (40) boot.esp32: SPI Speed      : 80MHz
    I (44) boot.esp32: SPI Mode       : DIO
    I (49) boot.esp32: SPI Flash Size : 2MB
    I (54) boot: Enabling RNG early entropy source...
    I (59) boot: Partition Table:
    I (63) boot: ## Label            Usage          Type ST Offset   Length
    I (70) boot:  0 nvs              WiFi data        01 02 00009000 00006000
    I (77) boot:  1 phy_init         RF data          01 01 0000f000 00001000
    I (85) boot:  2 factory          factory app      00 00 00010000 00100000
    I (92) boot: End of partition table
    I (96) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=2c470h (181360) map
    I (160) esp_image: segment 1: paddr=0003c498 vaddr=3ffb0000 size=03b80h ( 15232) load
    I (165) esp_image: segment 2: paddr=00040020 vaddr=400d0020 size=9dbc0h (646080) map
    I (360) esp_image: segment 3: paddr=000ddbe8 vaddr=3ffb3b80 size=00db4h (  3508) load
    I (361) esp_image: segment 4: paddr=000de9a4 vaddr=40080000 size=1bc98h (113816) load
    I (420) boot: Loaded app from partition at offset 0x10000
    I (420) boot: Disabling RNG early entropy source...
    I (432) cpu_start: Multicore app
    I (432) quad_psram: This chip is ESP32-D0WD
    I (433) esp_psram: Found 8MB PSRAM device
    I (434) esp_psram: Speed: 80MHz
    I (438) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
    W (445) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
    I (454) cpu_start: Pro cpu up.
    I (458) cpu_start: Starting app cpu, entry point is 0x40081704
    0x40081704: call_start_cpu1 at /Users/joshua/esp/esp-idf/components/esp_system/port/cpu_start.c:154

    I (0) cpu_start: App cpu up.
    I (979) esp_psram: SPI SRAM memory test OK
    I (987) cpu_start: Pro cpu start user code
    I (987) cpu_start: cpu freq: 160000000 Hz
    I (987) cpu_start: Application information:
    I (990) cpu_start: Project name:     esp32-vo
    I (995) cpu_start: App version:      3dc88df-dirty
    I (1001) cpu_start: Compile time:     Nov 10 2023 17:15:03
    I (1007) cpu_start: ELF file SHA256:  5248007c2f97ec9d...
    I (1013) cpu_start: ESP-IDF:          v5.1-rc2-dirty
    I (1018) cpu_start: Min chip rev:     v0.0
    I (1023) cpu_start: Max chip rev:     v3.99 
    I (1028) cpu_start: Chip rev:         v3.1
    I (1033) heap_init: Initializing. RAM available for dynamic allocation:
    I (1040) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
    I (1046) heap_init: At 3FFBAA28 len 000255D8 (149 KiB): DRAM
    I (1053) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
    I (1059) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
    I (1066) heap_init: At 4009BC98 len 00004368 (16 KiB): IRAM
    I (1072) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
    I (1080) spi_flash: detected chip: generic
    I (1084) spi_flash: flash io: dio
    W (1088) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
    I (1102) app_start: Starting scheduler on CPU0
    I (1107) app_start: Starting scheduler on CPU1
    I (1107) main_task: Started on CPU0
    I (1117) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
    I (1117) main_task: Calling app_main()

    ~~~~~ ESP32-CAM Vision Offloading ~~~~~ 

    Initializing Camera...
    I (1127) gpio: GPIO[25]| InputEn: 1| OutputEn: 0| OpenDrain: 0| Pullup: 1| Pulldown: 0| Intr:2 
    I (1137) cam_hal: cam init ok
    E (1147) camera: $$$ 2
    E (1147) camera: $$$ 3
    E (1147) camera: Enabling XCLK output
    E (1157) camera: $$$ 4
    E (1157) camera: Initializing SCCB
    I (1157) sccb: pin_sda 26 pin_scl 27
    I (1167) sccb: sccb_i2c_port=1
    E (1167) camera: $$$ 5
    E (1177) camera: $$$ 6
    E (1177) camera: Resetting camera by power down line
    I (1177) gpio: GPIO[32]| InputEn: 0| OutputEn: 1| OpenDrain: 0| Pullup: 0| Pulldown: 0| Intr:0 
    E (1207) camera: Searching for camera address
    I (1217) camera: Detected camera at address=0x30
    I (1217) camera: Detected OV2640 camera
    I (1217) camera: Camera PID=0x26 VER=0x42 MIDL=0x7f MIDH=0xa2
    E (1217) camera: Doing SW reset of sensor
    I (1307) cam_hal: buffer_size: 32768, half_buffer_size: 4096, node_buffer_size: 2048, node_cnt: 16, total_cnt: 93
    I (1307) cam_hal: Allocating 384000 Byte frame buffer in PSRAM
    I (1317) cam_hal: cam config ok
    E (1317) camera: Setting frame size to 1600x1200
    I (1327) ov2640: Set PLL: clk_2x: 0, clk_div: 0, pclk_auto: 0, pclk_div: 12
    Initializing Camera Done
    I (1457) wifi:wifi driver task: 3ffd39c0, prio:23, stack:6656, core=0
    I (1477) wifi:wifi firmware version: b2f1f86
    I (1477) wifi:wifi certification version: v7.0
    I (1477) wifi:config NVS flash: enabled
    I (1477) wifi:config nano formating: disabled
    I (1477) wifi:Init data frame dynamic rx buffer num: 32
    I (1487) wifi:Init management frame dynamic rx buffer num: 32
    I (1487) wifi:Init management short buffer num: 32
    I (1497) wifi:Init static tx buffer num: 16
    I (1497) wifi:Init tx cache buffer num: 32
    I (1507) wifi:Init static rx buffer size: 1600
    I (1507) wifi:Init static rx buffer num: 10
    I (1507) wifi:Init dynamic rx buffer num: 32
    I (1517) wifi_init: rx ba win: 6
    I (1517) wifi_init: tcpip mbox: 32
    I (1517) wifi_init: udp mbox: 6
    I (1527) wifi_init: tcp mbox: 6
    I (1527) wifi_init: tcp tx win: 5744
    I (1537) wifi_init: tcp rx win: 5744
    I (1537) wifi_init: tcp mss: 1440
    I (1547) wifi_init: WiFi IRAM OP enabled
    I (1547) wifi_init: WiFi RX IRAM OP enabled
    I (1557) phy_init: phy_version 4670,719f9f6,Feb 18 2021,17:07:07
    cam_hal: EV-EOF-OVF
    I (1657) wifi:mode : sta (a0:b7:65:50:de:a8)
    I (1657) wifi:enable tsf
    WiFi connecting ... 

    ===== Camera Capture Log ===== 
    I (1667) main_task: Returned from app_main()
    I (1667) wifi:new:<6,0>, old:<1,0>, ap:<255,255>, sta:<6,0>, prof:1
    I (1667) wifi:state: init -> auth (b0)
    I (1677) wifi:state: auth -> assoc (0)
    I (1687) wifi:state: assoc -> run (10)
    I (2147) wifi:connected with Josh's iPhone (2), aid = 2, channel 6, BW20, bssid = ce:8b:dc:fd:88:aa
    I (2147) wifi:security: WPA2-PSK, phy: bgn, rssi: -63
    I (2167) wifi:pm start, type: 1

    WiFi connected ... 
    I (2207) wifi:AP's beacon interval = 102400 us, DTIM period = 1
    I (2777) wifi:<ba-add>idx:0 (ifx:0, ce:8b:dc:fd:88:aa), tid:0, ssn:2, winSize:64
    I (3667) esp_netif_handlers: sta ip: 172.20.10.7, mask: 255.255.255.240, gw: 172.20.10.1
    WiFi got IP ... 

    W (23727) cam_hal: Attempting to get the frame from the queue
    W (23727) cam_hal: Got the frame from the queue
    I (29777) ESP32-CAM: MJPG: 102KB 6056ms (0.2fps)
    W (29777) cam_hal: Attempting to get the frame from the queue
    W (29877) cam_hal: Got the frame from the queue
    I (30407) ESP32-CAM: MJPG: 99KB 626ms (1.6fps)
    W (30407) cam_hal: Attempting to get the frame from the queue
    W (30517) cam_hal: Got the frame from the queue
    I (31387) ESP32-CAM: MJPG: 90KB 974ms (1.0fps)
    W (31387) cam_hal: Attempting to get the frame from the queue
    W (31477) cam_hal: Got the frame from the queue
    I (31927) ESP32-CAM: MJPG: 80KB 544ms (1.8fps)
    W (31927) cam_hal: Attempting to get the frame from the queue
    W (32037) cam_hal: Got the frame from the queue
    I (32817) ESP32-CAM: MJPG: 79KB 885ms (1.1fps)
    W (32817) cam_hal: Attempting to get the frame from the queue
    W (32917) cam_hal: Got the frame from the queue
    I (34207) ESP32-CAM: MJPG: 75KB 1390ms (0.7fps)
    W (34207) cam_hal: Attempting to get the frame from the queue
    W (34357) cam_hal: Got the frame from the queue
    W (36817) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (38737) ESP32-CAM: MJPG: 91KB 4530ms (0.2fps)
    W (38737) cam_hal: Attempting to get the frame from the queue
    W (38837) cam_hal: Got the frame from the queue
    I (40777) ESP32-CAM: MJPG: 116KB 2042ms (0.5fps)
    W (40777) cam_hal: Attempting to get the frame from the queue
    W (40917) cam_hal: Got the frame from the queue
    W (45117) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (45527) ESP32-CAM: MJPG: 109KB 4753ms (0.2fps)
    W (45527) cam_hal: Attempting to get the frame from the queue
    W (45627) cam_hal: Got the frame from the queue
    W (47877) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (49437) ESP32-CAM: MJPG: 118KB 3906ms (0.3fps)
    W (49437) cam_hal: Attempting to get the frame from the queue
    W (49547) cam_hal: Got the frame from the queue
    W (51997) wifi:[ADDBA]rx delba, code:1, delete tid:0
    W (55867) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (56487) ESP32-CAM: MJPG: 119KB 7049ms (0.1fps)
    W (56487) cam_hal: Attempting to get the frame from the queue
    W (56587) cam_hal: Got the frame from the queue
    I (59357) ESP32-CAM: MJPG: 106KB 2875ms (0.3fps)
    W (59367) cam_hal: Attempting to get the frame from the queue
    W (59467) cam_hal: Got the frame from the queue
    I (61577) ESP32-CAM: MJPG: 111KB 2212ms (0.5fps)
    W (61577) cam_hal: Attempting to get the frame from the queue
    W (61707) cam_hal: Got the frame from the queue
    I (63807) ESP32-CAM: MJPG: 114KB 2231ms (0.4fps)
    W (63807) cam_hal: Attempting to get the frame from the queue
    W (63937) cam_hal: Got the frame from the queue
    I (65197) ESP32-CAM: MJPG: 104KB 1388ms (0.7fps)
    W (65197) cam_hal: Attempting to get the frame from the queue
    W (65297) cam_hal: Got the frame from the queue
    I (65877) ESP32-CAM: MJPG: 107KB 682ms (1.5fps)
    W (65877) cam_hal: Attempting to get the frame from the queue
    W (66017) cam_hal: Got the frame from the queue
    I (68737) ESP32-CAM: MJPG: 113KB 2860ms (0.3fps)
    W (68737) cam_hal: Attempting to get the frame from the queue
    W (68817) cam_hal: Got the frame from the queue
    I (69797) ESP32-CAM: MJPG: 93KB 1059ms (0.9fps)
    W (69797) cam_hal: Attempting to get the frame from the queue
    W (69937) cam_hal: Got the frame from the queue
    I (72267) ESP32-CAM: MJPG: 102KB 2474ms (0.4fps)
    W (72277) cam_hal: Attempting to get the frame from the queue
    W (72417) cam_hal: Got the frame from the queue
    I (73207) ESP32-CAM: MJPG: 99KB 932ms (1.1fps)
    W (73207) cam_hal: Attempting to get the frame from the queue
    W (73297) cam_hal: Got the frame from the queue
    I (75887) ESP32-CAM: MJPG: 98KB 2682ms (0.4fps)
    W (75887) cam_hal: Attempting to get the frame from the queue
    W (76017) cam_hal: Got the frame from the queue
    I (78077) ESP32-CAM: MJPG: 99KB 2190ms (0.5fps)
    W (78077) cam_hal: Attempting to get the frame from the queue
    W (78177) cam_hal: Got the frame from the queue
    W (80137) wifi:[ADDBA]rx delba, code:1, delete tid:0
    W (80147) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (81817) ESP32-CAM: MJPG: 102KB 3736ms (0.3fps)
    W (81817) cam_hal: Attempting to get the frame from the queue
    W (81927) cam_hal: Got the frame from the queue
    I (82867) ESP32-CAM: MJPG: 92KB 1057ms (0.9fps)
    W (82867) cam_hal: Attempting to get the frame from the queue
    W (82967) cam_hal: Got the frame from the queue
    I (84107) ESP32-CAM: MJPG: 91KB 1234ms (0.8fps)
    W (84107) cam_hal: Attempting to get the frame from the queue
    W (84247) cam_hal: Got the frame from the queue
    I (85767) ESP32-CAM: MJPG: 93KB 1661ms (0.6fps)
    W (85767) cam_hal: Attempting to get the frame from the queue
    W (85847) cam_hal: Got the frame from the queue
    W (86997) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (89307) ESP32-CAM: MJPG: 92KB 3536ms (0.3fps)
    W (89307) cam_hal: Attempting to get the frame from the queue
    W (89447) cam_hal: Got the frame from the queue
    I (91687) ESP32-CAM: MJPG: 95KB 2387ms (0.4fps)
    W (91697) cam_hal: Attempting to get the frame from the queue
    W (91847) cam_hal: Got the frame from the queue
    I (95897) ESP32-CAM: MJPG: 97KB 4203ms (0.2fps)
    W (95897) cam_hal: Attempting to get the frame from the queue
    W (96007) cam_hal: Got the frame from the queue
    I (97057) ESP32-CAM: MJPG: 76KB 1163ms (0.9fps)
    W (97057) cam_hal: Attempting to get the frame from the queue
    W (97207) cam_hal: Got the frame from the queue
    I (97707) ESP32-CAM: MJPG: 79KB 644ms (1.6fps)
    W (97707) cam_hal: Attempting to get the frame from the queue
    W (97837) cam_hal: Got the frame from the queue
    W (100107) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (101017) ESP32-CAM: MJPG: 92KB 3316ms (0.3fps)
    W (101017) cam_hal: Attempting to get the frame from the queue
    W (101117) cam_hal: Got the frame from the queue
    I (105047) ESP32-CAM: MJPG: 98KB 4028ms (0.2fps)
    W (105047) cam_hal: Attempting to get the frame from the queue
    W (105197) cam_hal: Got the frame from the queue
    W (107167) wifi:[ADDBA]rx delba, code:1, delete tid:0
    W (118127) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (118437) ESP32-CAM: MJPG: 96KB 13388ms (0.1fps)
    W (118437) cam_hal: Attempting to get the frame from the queue
    W (118547) cam_hal: Got the frame from the queue
    I (120857) ESP32-CAM: MJPG: 95KB 2424ms (0.4fps)
    W (120857) cam_hal: Attempting to get the frame from the queue
    W (120947) cam_hal: Got the frame from the queue
    I (122527) ESP32-CAM: MJPG: 99KB 1663ms (0.6fps)
    W (122527) cam_hal: Attempting to get the frame from the queue
    W (122627) cam_hal: Got the frame from the queue
    I (127957) ESP32-CAM: MJPG: 96KB 5436ms (0.2fps)
    W (127957) cam_hal: Attempting to get the frame from the queue
    W (128067) cam_hal: Got the frame from the queue
    I (129067) ESP32-CAM: MJPG: 92KB 1105ms (0.9fps)
    W (129067) cam_hal: Attempting to get the frame from the queue
    W (129187) cam_hal: Got the frame from the queue
    I (129827) ESP32-CAM: MJPG: 97KB 760ms (1.3fps)
    W (129827) cam_hal: Attempting to get the frame from the queue
    W (129987) cam_hal: Got the frame from the queue
    I (130727) ESP32-CAM: MJPG: 96KB 903ms (1.1fps)
    W (130727) cam_hal: Attempting to get the frame from the queue
    W (130867) cam_hal: Got the frame from the queue
    W (135257) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (135637) ESP32-CAM: MJPG: 98KB 4909ms (0.2fps)
    W (135637) cam_hal: Attempting to get the frame from the queue
    W (135737) cam_hal: Got the frame from the queue
    W (138297) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (140217) ESP32-CAM: MJPG: 96KB 4572ms (0.2fps)
    W (140217) cam_hal: Attempting to get the frame from the queue
    W (140297) cam_hal: Got the frame from the queue
    I (142897) ESP32-CAM: MJPG: 97KB 2683ms (0.4fps)
    W (142897) cam_hal: Attempting to get the frame from the queue
    W (143017) cam_hal: Got the frame from the queue
    W (150267) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (150607) ESP32-CAM: MJPG: 92KB 7712ms (0.1fps)
    W (150607) cam_hal: Attempting to get the frame from the queue
    W (150697) cam_hal: Got the frame from the queue
    I (154297) ESP32-CAM: MJPG: 95KB 3686ms (0.3fps)
    W (154297) cam_hal: Attempting to get the frame from the queue
    W (154447) cam_hal: Got the frame from the queue
    W (157357) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (158737) ESP32-CAM: MJPG: 100KB 4437ms (0.2fps)
    W (158737) cam_hal: Attempting to get the frame from the queue
    W (158847) cam_hal: Got the frame from the queue
    I (160997) ESP32-CAM: MJPG: 88KB 2260ms (0.4fps)
    W (160997) cam_hal: Attempting to get the frame from the queue
    W (161087) cam_hal: Got the frame from the queue
    I (164397) ESP32-CAM: MJPG: 88KB 3404ms (0.3fps)
    W (164397) cam_hal: Attempting to get the frame from the queue
    W (164527) cam_hal: Got the frame from the queue
    I (167447) ESP32-CAM: MJPG: 98KB 3046ms (0.3fps)
    W (167447) cam_hal: Attempting to get the frame from the queue
    W (167567) cam_hal: Got the frame from the queue
    I (177857) ESP32-CAM: MJPG: 98KB 10415ms (0.1fps)
    W (177857) cam_hal: Attempting to get the frame from the queue
    W (177957) cam_hal: Got the frame from the queue
    I (180427) ESP32-CAM: MJPG: 90KB 2569ms (0.4fps)
    W (180427) cam_hal: Attempting to get the frame from the queue
    W (180517) cam_hal: Got the frame from the queue
    I (182007) ESP32-CAM: MJPG: 80KB 1577ms (0.6fps)
    W (182007) cam_hal: Attempting to get the frame from the queue
    W (182117) cam_hal: Got the frame from the queue
    W (183457) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (185517) ESP32-CAM: MJPG: 80KB 3505ms (0.3fps)
    W (185517) cam_hal: Attempting to get the frame from the queue
    W (185637) cam_hal: Got the frame from the queue
    I (189267) ESP32-CAM: MJPG: 91KB 3753ms (0.3fps)
    W (189267) cam_hal: Attempting to get the frame from the queue
    W (189387) cam_hal: Got the frame from the queue
    I (196507) ESP32-CAM: MJPG: 93KB 7238ms (0.1fps)
    W (196507) cam_hal: Attempting to get the frame from the queue
    W (196587) cam_hal: Got the frame from the queue
    W (202507) wifi:[ADDBA]rx delba, code:1, delete tid:0
    I (204457) ESP32-CAM: MJPG: 122KB 7951ms (0.1fps)
    W (204457) cam_hal: Attempting to get the frame from the queue
    W (204587) cam_hal: Got the frame from the queue
    I (208867) ESP32-CAM: MJPG: 126KB 4413ms (0.2fps)
    W (208867) cam_hal: Attempting to get the frame from the queue
    W (208977) cam_hal: Got the frame from the queue
    I (229837) ESP32-CAM: MJPG: 81KB 20969ms (0.0fps)
    W (229837) cam_hal: Attempting to get the frame from the queue
    W (229927) cam_hal: Got the frame from the queue
    W (235687) wifi:[ADDBA]rx delba, code:1, delete tid:0
    W (245727) wifi:[ADDBA]rx delba, code:1, delete tid:0
    W (250757) httpd_txrx: httpd_sock_err: error in send : 11
    W (250757) httpd_uri: httpd_uri: uri handler execution failed
    W (250757) httpd_txrx: httpd_sock_err: error in recv : 104
    None
    Waiting for the device to reconnect...........
    ```
    </details>

## Troubleshooting

### Getting linting/Intellisense errors (red squiggles under your code)

First build the project using `make build`

Then, create a `c_cpp_properties.json` file using the **`ESP-IDF: Add vscode configuration folder`** command

Replace `${workspaceFolder}/.vscode/c_cpp_properties.json` with:

```json
{
    "configurations": [
        {
            "name": "ESP-IDF",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "compileCommands": "${workspaceFolder}/build/compile_commands.json"
        }
    ],
    "version": 4
}
```

### Can't see port /dev/cu.usbserial-*

Take a look at [this link](https://docs.espressif.com/projects/esp-idf/en/v4.2.3/esp32/get-started/establish-serial-connection.html).

### Failed to connect to ESP32

```
Connecting......................................

A fatal error occurred: Failed to connect to ESP32: No serial data received.
```

Make sure:
- You press the `RST` button on the ESP32-CAM to reset the board after seeing `Serial port /dev/cu.usbserial-A50285BI` in the output
- ESP32-CAM is correctly wired to the UART to USB converter
- Converter's VCC pin is connected to the converter's 5V pin
- You try to connect the `GND` line to another `GND` pin on the ESP32-CAM

### cam_dma_config(300): frame buffer malloc failed

```
I (416) camera: Detected camera at address=0x30
I (416) camera: Detected OV2640 camera
I (416) camera: Camera PID=0x26 VER=0x42 MIDL=0x7f MIDH=0xa2
I (496) cam_hal: buffer_size: 32768, half_buffer_size: 4096, node_buffer_size: 2048, node_cnt: 16, total_cnt: 93
I (496) cam_hal: Allocating 384000 Byte frame buffer in PSRAM
E (506) cam_hal: cam_dma_config(300): frame buffer malloc failed
E (516) cam_hal: cam_config(384): cam_dma_config failed
E (516) camera: Camera config failed with error 0xffffffff
E (526) ESP32-CAM: Camera Init Failed

 ===== Camera Capture Log ===== 
E (536) ESP32-CAM: Camera Capture Failed
I (536) main_task: Returned from app_main()
```

Make sure:
- `"esp_camera.h"` is included in [`main/esp32-vo.c`](main/esp32-vo.c)
- You follow the [**Configure**](#configure) section instructions above

Also check here: [esp32-camera](https://github.com/espressif/vscode-esp-idf-extension/blob/HEAD/docs/tutorial/basic_use.md)

### esp-tls: couldn't get hostname for :<hostname>: getaddrinfo() returns 202, addrinfo=0x0

```
E (3364) esp-tls: couldn't get hostname for :worldtimeapi.org: getaddrinfo() returns 202, addrinfo=0x0
E (3374) transport_base: Failed to open a new connection: 32769
E (3374) HTTP_CLIENT: Connection failed, sock < 0
```

Make sure:
- Internet is on
- SSID and password are correctly set in `menuconfig` (`WIFI` &rarr; `SSID`, `Password`)
- There is enough delay in between connecting to the WiFi and making the HTTP request (e.g. 10 seconds)