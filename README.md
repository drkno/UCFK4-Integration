UCFK4-Integration
=================

This is a Visual Studio 2013 project that attempts to make the UCFK4 (University of Canterbury Fun Kit v4) integrate with Visual Studio. At present it is minimal and only just works.

To get working:
-------------------
Here be dragons!
1.	Install WinAVR
2.	Install dfu-programmer to the bin directory of WinAVR
3.	Add the bin directory of WinAVR to the system/user path
4.	Install the AVR driver from the dfu-programmer package
5.	Adjust build.bat where necercery.
6.	Run VSgcc.sln and create your project.

Notes:
---------
1.	The current debug target does not work because there is no <terminos.h> on windows.
2.	The provided UCFK make files require the following mods to work (as of 2014):
	a. The DEL = rm line needs to be changed to DEL = del
	b. The line dfu-programmer .... ; dfu-programmer .... ; dfu-programmer .... needs new lines or '&' instead of ';'
3.	This visual studio integration supports git so committing projects should be easy.
4.	The file gccconvert.cpp and executable gccconvert.exe are to convert errors to the Visual Studio format from the gcc format. The .cpp can be deleted if not needed but if you want errors to work keep the .exe .
	
Further Note:
---------------
When WinAVR is installed it automatically integrates with Code::Blocks (if Code::Blocks is installed). This just means that the header files of the UCFK "API" need to be added to a Code::Blocks WinAVR project and then Code::Blocks will work out of the box (no further messing around like for VS). Sure it doesn't have nice intellisence or practically anything that we like about Visual Studio but its a crapload nicer than Geany/command-line/booting up a virtual machine. Also Code::Blocks has a nice Tetris and Snake game built in for when you can't be bothered working on code :).

Released under the MIT license.
