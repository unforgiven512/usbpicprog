# usbpicprog #

This is a fork of the [usbpicprog][1] project, featuring various enhancements and updates. The original [usbpicprog][1]
project is featured as an _open-source_ **USB** PIC programmer; the original git repository is found [here][2].


## Original Project Information ##

For more information please visit: [usbpicprog.org][1]

The `trunk/` folder _(it's there for historical reasons)_ contains a handful of subfolders:

* `upp_wx/`: The **PC** application, also called `usbpicprog-software`
* `uc_code/`: The **PIC** firmware, also called `usbpicprog-firmware`
* `pcb/`: The **PCB** design, made in [KiCad][3], for the PIC programmer in SMD, through-hole and a ZIF socket
* `boot/`: The _(slightly modified)_ PICDEM bootloader, which has to be programmed once in the microcontroller on the
  **usbpicprog** hardware
* `doc/`: A bunch of programming specifications, provided by [Microchip][4]


## Modifications, Enhancements, and Feature Updates ##

This section will list the various **modifications**, **enhancements** and _(potential)_ **feature updates** that have
been added to the project by me.


### Modifications ###

For the most part, the **modifications** will not cause any _functional_ change in the project, but is moreso aimed at
improving the **source code formatting**, the **documentation**, and the **build/release** infrastructure; this should
facilitate further development of the project.

Some modifications that are either completed or planned are listed below:
- Update documentation
  - Ensure all source code is documented with [doxygen][5] compatible comments
  - Improvements to the format of the contents of the `doc/` folder
  - New documentation
- Updates to the build scripts




[1]:    <http://usbpicprog.org>
[2]:    <https://github.com/fransschreuder/usbpicprog>
[3]:    <http://www.kicad-pcb.org>
[4]:    <https://www.microchip.com>
[5]:    <http://doxygen.org>

