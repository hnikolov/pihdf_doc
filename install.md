---
title: Install
layout: page 
pager: true
---

Below, we present the steps to instal `pihdf` with all the dependencies, considering Linux Ubuntu distribution.
{.lead}

MacOS is supported as well. However, we do not provide details about how to install `pihdf` on MacOS.

Installing `pihdf` is simple as
{.lead}

```.bash
$ cd pihdf
$ sudo ./install
```
However, there are some dependences as well. Please check them below.

Python packages
===============
`pihdf` needs the following python packages: __myhdl, simplejson, coverage, nose__. 
These can be installed with a single command:

```.bash
$ sudo pip install myhdl simplejson coverage nose -I
```

If you do not have `pip` installed:
```.bash
$ sudo apt-get install python-pip python-dev build-essential 
$ sudo pip install --upgrade pip 
```

Co-simulation, waveform and dotty viewers
=========================================
For co-simulations, `pihdf` uses the __Icarus iverilog__ simulator. __GTKWave__ is the waveform viewer used in `pihdf`. For structured designs, `pihdf` generates also the design topology (i.e., HW modules interconnections) as a `.dot` file. To viasualize it, you can use `xdot` program. Install all programs by executing:

```.bash
$ sudo apt-get install iverilog gtkwave xdot
```

<!--
Icarus
======
For co-simulations, `pihdf` uses the Icarus simulator. The version we suggest is `jeras-iverilog-bae0243`.
Icarus requires __autoconf, flex, bison, gperf__ to be installed. If you do not have them already on your system:

```.bash
$ sudo apt-get install autoconf flex bison gperf
```

To install __Icarus__ simulator, download and unzip `jeras-iverilog-bae0243.zip` file. Then,

```.bash
$ cd jeras-iverilog-bae0243
$ autoconf
$ ./configure
$ make 
$ sudo make install
$ cd ..
```

__GTKWave__ is the waveform viewer used in `pihdf`. Install it by:

```.bash
$ sudo apt-get install gtkwave
```
-->

Create `myhdl.vpi`
==================
For co-simuations, myhdl uses a `.vpi` interface. To create the `myhdl.vpi` file used with Icarus, download the source of myhdl. Then,

```.bash
$ cd [myhdl-folder]/cosimulation/icarus/
$ make 
```

pihdf
=====

Download and unzip `pihdf`. Then,

```.bash
$ cd pihdf
$ sudo ./install
```

Copy the generated `myhdl.vpi` file to directory `/.pihdf`. Finally, add directory `/.pihdf` to _PATH_.
You can do this by adding the following line to your .bashrc file:

```.bash
export PATH=$PATH:/.pihdf
```

* * *
Now, you are ready to use `pihdf`. Check its [front-end tool][module] (called 'module'), the [details][details] about `pihdf`, and the [turorials][tutorials] that will help you to get started.
{.lead}

* * *
Uninstall `pihdf`
=================
To remove `pihdf` from your system, just use the provided script:

```.bash
$ cd pihdf
$ sudo ./uninstall
```
__Note:__ This will remove only `pihdf`. `MyHDL` and all other installed packages and programs (see above) will remain on your system.
