@echo off

if "%1" == "Debug" (goto :debug)

"C:\Program Files (x86)\UCFC\compiler\bin\avr-gcc.exe" *.c -mmcu=atmega32u2 -Os -Wall -Wstrict-prototypes -Wextra -Werror -std=c99 -lm -g -I"C:\Program Files (x86)\UCFC\ucfcapi\avr" -I"C:\Program Files (x86)\UCFC\ucfcapi\extra" -I"C:\Program Files (x86)\UCFC\ucfcapi\fonts" -I"C:\Program Files (x86)\UCFC\ucfcapi\utils" -I"C:\Program Files (x86)\UCFC\ucfcapi" "C:\Program Files (x86)\UCFC\ucfcapi\button.c" "C:\Program Files (x86)\UCFC\ucfcapi\display.c" "C:\Program Files (x86)\UCFC\ucfcapi\ir.c" "C:\Program Files (x86)\UCFC\ucfcapi\ir_serial.c" "C:\Program Files (x86)\UCFC\ucfcapi\led.c" "C:\Program Files (x86)\UCFC\ucfcapi\ledmat.c" "C:\Program Files (x86)\UCFC\ucfcapi\navswitch.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\eeprom.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\ir_uart.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\pio.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\prescale.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\system.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\timer.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\timer0.c" "C:\Program Files (x86)\UCFC\ucfcapi\avr\usart1.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\mmelody.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\ticker.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\tweeter.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\boing.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\font.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\pacer.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\spwm.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\task.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\tinygl.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\uint8toa.c" -o %3.out 2> output.last || goto :gccerr
"C:\Program Files (x86)\UCFC\compiler\bin\avr-objcopy.exe" -O ihex "%3.out" "%3.hex"
"C:\Program Files (x86)\UCFC\compiler\utils\bin\dfu-programmer.exe" atmega32u2 erase
"C:\Program Files (x86)\UCFC\compiler\utils\bin\dfu-programmer.exe" atmega32u2 flash "%3.hex"
"C:\Program Files (x86)\UCFC\compiler\utils\bin\dfu-programmer.exe" atmega32u2 start

goto :eof

:gccerr
gccconvert.exe
exit /b
goto :eof

:debug
"C:\Program Files (x86)\CodeBlocks\MinGW\bin\gcc.exe" *.c -Os -Wall -Wstrict-prototypes -Wextra -Werror -std=c99 -lm -g -I"C:\Program Files (x86)\UCFC\ucfcapi\test" -I"C:\Program Files (x86)\UCFC\ucfcapi\extra" -I"C:\Program Files (x86)\UCFC\ucfcapi\fonts" -I"C:\Program Files (x86)\UCFC\ucfcapi\utils" -I"C:\Program Files (x86)\UCFC\ucfcapi" "C:\Program Files (x86)\UCFC\ucfcapi\button.c" "C:\Program Files (x86)\UCFC\ucfcapi\display.c" "C:\Program Files (x86)\UCFC\ucfcapi\ir.c" "C:\Program Files (x86)\UCFC\ucfcapi\ir_serial.c" "C:\Program Files (x86)\UCFC\ucfcapi\led.c" "C:\Program Files (x86)\UCFC\ucfcapi\ledmat.c" "C:\Program Files (x86)\UCFC\ucfcapi\navswitch.c" "C:\Program Files (x86)\UCFC\ucfcapi\test\eeprom.c" "C:\Program Files (x86)\UCFC\ucfcapi\test\ir_uart.c" "C:\Program Files (x86)\UCFC\ucfcapi\test\pio.c" "C:\Program Files (x86)\UCFC\ucfcapi\test\system.c" "C:\Program Files (x86)\UCFC\ucfcapi\test\timer.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\mmelody.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\ticker.c" "C:\Program Files (x86)\UCFC\ucfcapi\extra\tweeter.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\boing.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\font.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\pacer.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\spwm.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\task.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\tinygl.c" "C:\Program Files (x86)\UCFC\ucfcapi\utils\uint8toa.c" -o %3.exe 2> output.last || goto :gccerr
goto :eof