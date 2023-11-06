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
    I (31) boot: compile time Oct 24 2023 16:52:50
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
    I (96) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=12b98h ( 76696) map
    I (128) esp_image: segment 1: paddr=00022bc0 vaddr=3ffb0000 size=0336ch ( 13164) load
    I (133) esp_image: segment 2: paddr=00025f34 vaddr=40080000 size=0a0e4h ( 41188) load
    I (148) esp_image: segment 3: paddr=00030020 vaddr=400d0020 size=25ec4h (155332) map
    I (196) esp_image: segment 4: paddr=00055eec vaddr=4008a0e4 size=080bch ( 32956) load
    I (217) boot: Loaded app from partition at offset 0x10000
    I (217) boot: Disabling RNG early entropy source...
    I (228) cpu_start: Multicore app
    I (228) quad_psram: This chip is ESP32-D0WD
    I (230) esp_psram: Found 8MB PSRAM device
    I (231) esp_psram: Speed: 80MHz
    I (234) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
    W (242) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
    I (251) cpu_start: Pro cpu up.
    I (255) cpu_start: Starting app cpu, entry point is 0x40081464
    0x40081464: call_start_cpu1 at /Users/joshua/esp/esp-idf/components/esp_system/port/cpu_start.c:154

    I (0) cpu_start: App cpu up.
    I (776) esp_psram: SPI SRAM memory test OK
    I (784) cpu_start: Pro cpu start user code
    I (784) cpu_start: cpu freq: 160000000 Hz
    I (784) cpu_start: Application information:
    I (787) cpu_start: Project name:     esp32-vo
    I (792) cpu_start: App version:      39ca9e5-dirty
    I (797) cpu_start: Compile time:     Oct 24 2023 17:01:22
    I (803) cpu_start: ELF file SHA256:  9c7957b240d59afd...
    I (809) cpu_start: ESP-IDF:          v5.1-rc2-dirty
    I (815) cpu_start: Min chip rev:     v0.0
    I (820) cpu_start: Max chip rev:     v3.99 
    I (824) cpu_start: Chip rev:         v3.1
    I (829) heap_init: Initializing. RAM available for dynamic allocation:
    I (836) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
    I (842) heap_init: At 3FFB3CD0 len 0002C330 (176 KiB): DRAM
    I (849) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
    I (855) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
    I (861) heap_init: At 400921A0 len 0000DE60 (55 KiB): IRAM
    I (868) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
    I (876) spi_flash: detected chip: generic
    I (880) spi_flash: flash io: dio
    W (884) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
    I (897) app_start: Starting scheduler on CPU0
    I (902) app_start: Starting scheduler on CPU1
    I (902) main_task: Started on CPU0
    I (912) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
    I (912) main_task: Calling app_main()

    ~~~~~ ESP32-CAM Vision Offloading ~~~~~ 

    Initializing Camera...
    I (922) gpio: GPIO[25]| InputEn: 1| OutputEn: 0| OpenDrain: 0| Pullup: 1| Pulldown: 0| Intr:2 
    I (932) cam_hal: cam init ok
    I (942) sccb: pin_sda 26 pin_scl 27
    I (942) sccb: sccb_i2c_port=1
    I (942) gpio: GPIO[32]| InputEn: 0| OutputEn: 1| OpenDrain: 0| Pullup: 0| Pulldown: 0| Intr:0 
    I (982) camera: Detected camera at address=0x30
    I (982) camera: Detected OV2640 camera
    I (982) camera: Camera PID=0x26 VER=0x42 MIDL=0x7f MIDH=0xa2
    I (1062) cam_hal: buffer_size: 32768, half_buffer_size: 4096, node_buffer_size: 2048, node_cnt: 16, total_cnt: 93
    I (1062) cam_hal: Allocating 384000 Byte frame buffer in PSRAM
    I (1072) cam_hal: cam config ok
    I (1072) ov2640: Set PLL: clk_2x: 0, clk_div: 0, pclk_auto: 0, pclk_div: 12
    Initializing Camera Done

    ===== Camera Capture Log ===== 
    [465798] F0: 1600 x 1200, format 4, length 38127
    [625724] F1: 1600 x 1200, format 4, length 226628
    [785631] F2: 1600 x 1200, format 4, length 208620
    [945534] F3: 1600 x 1200, format 4, length 171173
    [1105447] F4: 1600 x 1200, format 4, length 205566
    .
    .
    .
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