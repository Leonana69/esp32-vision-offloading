# EPS-IDF for EPS32-CAM Tutorial

Source: [vscode-esp-idf-extension](https://github.com/espressif/vscode-esp-idf-extension/blob/HEAD/docs/tutorial/basic_use.md)

## Set up EPS-IDF

1. Install Espressif-IDF (ESP_IDF) using [these instructions](https://github.com/espressif/vscode-esp-idf-extension/blob/6becb8ef795b3e257e25b1628562f1219430094b/docs/tutorial/install.md)
    
    For **`Select ESP-IDF version`**, choose `v5.1-rc2 (release version)` as the version to install

## Build, Flash, and Run an EPS-IDF Project for EPS32-CAM

1. Open the project folder in VSCode
    
1. Select `esp32` as the Espressif target (`esp32`, `esp32s2`, etc.) with the **`ESP-IDF: Set Espressif device target`** command
    
    First, for "Pick Workspace Folder to which settings should be applied", select the project folder
    
    Then, select `esp32`. This will show a list of ESP32 variants. Just hit `Esc` to close the options
    
    You should see a new generated file in the project root folder named `sdkconfig`

1. Build the project using the **`ESP-IDF: Build your project command`**

    <details>
    <summary>Example of successful build output</summary>

    **Terminal 1:**

    ```
    [7/915] Generating ../../partition_table/partition-table.bin
    Partition table binary generated. Contents:
    *******************************************************************************
    # ESP-IDF Partition Table
    # Name, Type, SubType, Offset, Size, Flags
    nvs,data,nvs,0x9000,24K,
    phy_init,data,phy,0xf000,4K,
    factory,app,factory,0x10000,1M,
    *******************************************************************************
    [418/915] Performing configure step for 'bootloader'
    -- Found Git: /usr/bin/git (found version "2.37.1 (Apple Git-137.1)") 
    -- The C compiler identification is GNU 12.2.0
    -- The CXX compiler identification is GNU 12.2.0
    -- The ASM compiler identification is GNU
    -- Found assembler: /Users/joshua/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
    -- Detecting C compiler ABI info
    .
    .
    .
    -- Detecting CXX compile features - done
    -- Building ESP-IDF components for target esp32
    -- Project sdkconfig file /Users/joshua/_yale/academics/23fall/CPSC429/blink/sdkconfig
    Compiler supported targets: xtensa-esp32-elf

    -- Looking for sys/types.h
    .
    .
    .
    -- App "bootloader" version: v5.1-rc2-dirty
    .
    .
    .
    -- Components: bootloader bootloader_support efuse esp_app_format esp_common esp_hw_support esp_rom esp_system esptool_py freertos hal log main micro-ecc newlib partition_table soc spi_flash xtensa
    -- Component paths: /Users/joshua/esp/esp-idf/components/bootloader /Users/joshua/esp/esp-idf/components/bootloader_support /Users/joshua/esp/esp-idf/components/efuse /Users/joshua/esp/esp-idf/components/esp_app_format /Users/joshua/esp/esp-idf/components/esp_common /Users/joshua/esp/esp-idf/components/esp_hw_support /Users/joshua/esp/esp-idf/components/esp_rom /Users/joshua/esp/esp-idf/components/esp_system /Users/joshua/esp/esp-idf/components/esptool_py /Users/joshua/esp/esp-idf/components/freertos /Users/joshua/esp/esp-idf/components/hal /Users/joshua/esp/esp-idf/components/log /Users/joshua/esp/esp-idf/components/bootloader/subproject/main /Users/joshua/esp/esp-idf/components/bootloader/subproject/components/micro-ecc /Users/joshua/esp/esp-idf/components/newlib /Users/joshua/esp/esp-idf/components/partition_table /Users/joshua/esp/esp-idf/components/soc /Users/joshua/esp/esp-idf/components/spi_flash /Users/joshua/esp/esp-idf/components/xtensa
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/bootloader
    [536/915] Performing build step for 'bootloader'
    [1/103] Generating project_elf_src_esp32.c
    [2/103] Building C object esp-idf/xtensa/CMakeFiles/__idf_xtensa.dir/eri.c.obj
    [3/103] Building C object esp-idf/soc/CMakeFiles/__idf_soc.dir/dport_access_common.c.obj
    .
    .
    .
    [98/103] Linking C static library esp-idf/soc/libsoc.a
    [99/103] Linking C static library esp-idf/xtensa/libxtensa.a
    [100/103] Linking C static library esp-idf/main/libmain.a
    [101/103] Linking C executable bootloader.elf
    [102/103] Generating binary image from built executable
    esptool.py v4.7.dev2
    Creating esp32 image...
    Merged 1 ELF section
    Successfully created esp32 image.
    Generated /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/bootloader/bootloader.bin
    [103/103] cd /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/bootloader/esp-idf/esptool_py && /Users/joshua/.espressif/python_env/idf5.1_py3.9_env/bin/python /Users/joshua/esp/esp-idf/components/partition_table/check_sizes.py --offset 0x8000 bootloader 0x1000 /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/bootloader/bootloader.bin
    Bootloader binary size 0x6810 bytes. 0x7f0 bytes (7%) free.
    [914/915] Generating binary image from built executable
    esptool.py v4.7.dev2
    Creating esp32 image...
    Merged 2 ELF sections
    Successfully created esp32 image.
    Generated /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/blink.bin
    [915/915] cd /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/esp-i...able.bin /Users/joshua/_yale/academics/23fall/CPSC429/blink/build/blink.bin
    blink.bin binary size 0x2c4c0 bytes. Smallest app partition is 0x100000 bytes. 0xd3b40 bytes (83%) free.
    ```

    **Terminal 2:**

    ```
    Total sizes:
    Used static DRAM:   10672 bytes ( 170064 remain, 5.9% used)
        .data size:    8520 bytes
        .bss  size:    2152 bytes
    Used static IRAM:   48698 bytes (  82374 remain, 37.2% used)
        .text size:   47671 bytes
    .vectors size:    1027 bytes
    Used Flash size :  124119 bytes
            .text:   84463 bytes
            .rodata:   39400 bytes
    Total image size:  181337 bytes (.bin may be padded larger)
    ```
    </details>

1. Fix Intellisense errors
    
    Create a `c_cpp_properties.json` file using the **`ESP-IDF: Add vscode configuration folder`** command

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

1. Connect the ESP32-CAM to a UART to USB converter using the following pins:

    - Converter `GND` to ESP32-CAM `GND`
    - Converter `5V` to Converter `VCC`
    - Converter `VCC` to ESP32-CAM `5V`
    - Converter `TX` to ESP32-CAM `U0R`
    - Converter `RX` to ESP32-CAM `U0T`
    - ESP32-CAM `IO0` to ESP32-CAM `GND` (this is to put the ESP32-CAM in flash mode)

1. Connect the UART to USB converter to your computer via USB

1. Select the serial port of the device with the **`ESP-IDF: Select port to use`** command (e.g. `/dev/cu.usbserial-A50285BI`)

1. Flash the project to the ESP32-CAM using the **`ESP-IDF: Flash your project`** command

    <details>
    <summary>Example of successful flash output</summary>

    ```
    esptool.py v4.7.dev2
    Serial port /dev/cu.usbserial-A50285BI
    Connecting...
    Chip is ESP32-D0WD-V3 (revision v3.1)
    Features: WiFi, BT, Dual Core, 240MHz, VRef calibration in efuse, Coding Scheme None
    Crystal is 40MHz
    MAC: a0:b7:65:50:de:a8
    Stub is already running. No upload is necessary.
    Configuring flash size...
    Flash will be erased from 0x00001000 to 0x00007fff...
    Flash will be erased from 0x00010000 to 0x00048fff...
    Flash will be erased from 0x00008000 to 0x00008fff...
    Compressed 26656 bytes to 16666...
    Wrote 26656 bytes (16666 compressed) at 0x00001000 in 1.9 seconds (effective 110.3 kbit/s)...
    Hash of data verified.
    Compressed 232304 bytes to 118957...
    Wrote 232304 bytes (118957 compressed) at 0x00010000 in 10.7 seconds (effective 174.3 kbit/s)...
    Hash of data verified.
    Compressed 3072 bytes to 103...
    Wrote 3072 bytes (103 compressed) at 0x00008000 in 0.1 seconds (effective 256.6 kbit/s)...
    Hash of data verified.

    Leaving...
    Hard resetting via RTS pin...
    ```
    </details>

1. Monitor the project using the **`ESP-IDF: Monitor your project`** command

    <details>
    <summary>Example of successful monitor</summary>

    ```
    --- esp-idf-monitor 1.3.2 on /dev/cu.usbserial-A50285BI 115200 ---
    --- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
    ```
    </details>

1. Disconnect the connection from ESP32-CAM `IO0` to ESP32-CAM `GND` to put the ESP32-CAM in run mode

1. Reset the ESP32-CAM by pressing the `RST` button on the board which should cause the ESP32-CAM to start running the project

    <details>
    <summary>Example of successful run</summary>

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
    I (31) boot: compile time Oct 19 2023 10:18:51
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
    I (96) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=0def8h ( 57080) map
    I (122) esp_image: segment 1: paddr=0001df20 vaddr=3ffb0000 size=020f8h (  8440) load
    I (125) esp_image: segment 2: paddr=00020020 vaddr=400d0020 size=18ddch (101852) map
    I (159) esp_image: segment 3: paddr=00038e04 vaddr=3ffb20f8 size=000d8h (   216) load
    I (159) esp_image: segment 4: paddr=00038ee4 vaddr=40080000 size=0fc60h ( 64608) load
    I (195) boot: Loaded app from partition at offset 0x10000
    I (195) boot: Disabling RNG early entropy source...
    I (207) cpu_start: Multicore app
    I (207) quad_psram: This chip is ESP32-D0WD
    I (208) esp_psram: Found 8MB PSRAM device
    I (209) esp_psram: Speed: 80MHz
    I (213) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
    W (220) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
    I (230) cpu_start: Pro cpu up.
    I (233) cpu_start: Starting app cpu, entry point is 0x400812b8
    0x400812b8: call_start_cpu1 at /Users/joshua/esp/esp-idf/components/esp_system/port/cpu_start.c:154

    I (0) cpu_start: App cpu up.
    I (754) esp_psram: SPI SRAM memory test OK
    I (762) cpu_start: Pro cpu start user code
    I (762) cpu_start: cpu freq: 160000000 Hz
    I (762) cpu_start: Application information:
    I (765) cpu_start: Project name:     blink
    I (770) cpu_start: App version:      1
    I (774) cpu_start: Compile time:     Oct 19 2023 10:18:48
    I (780) cpu_start: ELF file SHA256:  2d6ae40bb94c9bad...
    I (786) cpu_start: ESP-IDF:          v5.1-rc2-dirty
    I (792) cpu_start: Min chip rev:     v0.0
    I (797) cpu_start: Max chip rev:     v3.99 
    I (802) cpu_start: Chip rev:         v3.1
    I (806) heap_init: Initializing. RAM available for dynamic allocation:
    I (814) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
    I (820) heap_init: At 3FFB2AA8 len 0002D558 (181 KiB): DRAM
    I (826) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
    I (832) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
    I (839) heap_init: At 4008FC60 len 000103A0 (64 KiB): IRAM
    I (845) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
    I (853) spi_flash: detected chip: generic
    I (857) spi_flash: flash io: dio
    W (861) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
    I (874) app_start: Starting scheduler on CPU0
    I (879) app_start: Starting scheduler on CPU1
    I (879) main_task: Started on CPU0
    I (889) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
    I (889) main_task: Calling app_main()
    I (899) example: Example configured to blink GPIO LED!
    I (899) gpio: GPIO[33]| InputEn: 0| OutputEn: 0| OpenDrain: 0| Pullup: 1| Pulldown: 0| Intr:0 
    I (909) example: Turning the LED OFF!
    I (1919) example: Turning the LED ON!
    I (2919) example: Turning the LED OFF!
    I (3919) example: Turning the LED ON!
    I (4919) example: Turning the LED OFF!
    .
    .
    .
    ```
    </details>

## Troubleshooting

#### Can't see port /dev/cu.usbserial-*

Take a look at [this link](https://docs.espressif.com/projects/esp-idf/en/v4.2.3/esp32/get-started/establish-serial-connection.html).

#### Failed to connect to ESP32

```
Connecting......................................

A fatal error occurred: Failed to connect to ESP32: No serial data received.
```

Make sure:
- ESP32-CAM is correctly wired to the UART to USB converter
- Converter's VCC pin is connected to the converter's 5V pin
- Include `"esp_camera.h"` in source file
- In `menuconfig`:
    - Under **ESP PSRAM**, **`Support for external, SPI-connected RAM`** is enabled
    - Under **Serial flasher config**, **`Flash SPI speed`** is set to **`80 MHz`**
    - Under **SPI RAM config**, **`Set RAM clock speed`** is set to **`80MHz Clock Speed`**

Also check here: [esp32-camera](https://github.com/espressif/vscode-esp-idf-extension/blob/HEAD/docs/tutorial/basic_use.md)