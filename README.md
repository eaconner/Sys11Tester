# Williams System 11 Pinball PIA Tester

## Usage
Burn [Sys11Tester.bin](https://raw.githubusercontent.com/eaconner/Sys11Tester/master/Sys11Tester.bin) to a 27256 EPROM.
Remove the System 11 CPU board from the cabinet.
Replace the game ROM in location U27 with the test ROM.
Connect the CPU board to 5vdc and ground and make a temporary connection from 5vdc to the right side of zener diode ZR1.
Now using a logic probe or oscilloscope check all of the PIA outputs and the latch at location U28. The signal should be pulsing high and low.

## To-Do
- Add diagnostic memory test
- Add in-game test

This Test ROM is provided "AS IS" without any warranties or support. In no event will the creator be liable for any loss or damage including without limitation, indirect or consequential loss or damage, or any loss or damage whatsoever arising from the use of this Test ROM.
