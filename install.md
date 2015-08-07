---
title: Install
layout: page 
pager: true
---

Below, we present the steps to instal `pyhdf` with all the dependencies, considering Linux Ubuntu distribution.
{.lead}

MacOS is supported as well. However, we do not provide details about how to install `pyhdf` on MacOS.

Installing `pyhdf` is simple as
{.lead}

```.bash
$ cd pyhdf
$ sudo ./install
```
However, there are some dependences as well. Please check them below.

Python packages
===============
`pyhdf` needs the following python packages: __myhdl, simplejson, coverage, nose__. 
These can be installed with a single command:

```.bash
$ sudo pip install myhdl simplejson coverage nose -I
```

If you do not have `pip` installed:
```.bash
$ sudo apt-get install python-pip python-dev build-essential 
$ sudo pip install --upgrade pip 
```

Co-simulation and waveform viewer
=================================
For co-simulations, `pyhdf` uses the __Icarus iverilog__ simulator. __GTKWave__ is the waveform viewer used in `pyhdf`.
Install both tools by executing:

```.bash
$ sudo apt-get install iverilog gtkwave
```

<!--
Icarus
======
For co-simulations, `pyhdf` uses the Icarus simulator. The version we suggest is `jeras-iverilog-bae0243`.
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

__GTKWave__ is the waveform viewer used in `pyhdf`. Install it by:

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

pyhdf
=====

Download and unzip `pyhdf`. Then,

```.bash
$ cd pyhdf
$ sudo ./install
```

Copy the generated `myhdl.vpi` file to directory `/.pyhdf`. Finally, add directory `/.pyhdf` to _PATH_.
You can do this by adding the following line to your .bashrc file:

```.bash
export PATH=$PATH:/.pyhdf
```

* * *
Now, you are ready to use `pyhdf`. Check its [front-end tool][module] (called 'module'), the [details][details] about `pyhdf`, and the [turorials][tutorials] that will help you to get started.
{.lead}

* * *
Uninstall `pyhdf`
=================
To remove `pyhdf` from your system, just use the provided script:

```.bash
$ cd pyhdf
$ sudo ./uninstall
```
__Note:__ This will remove only `pyhdf`. `MyHDL` and all other installed packages and programs (see above) will remain on your system.