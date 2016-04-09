---
title: Install
layout: page 
pager: true
---

Below, we present the steps to instal `pihdf` with all the dependencies, considering Linux Ubuntu distribution.
{.lead}

MacOS is supported as well. However, we do not provide details about how to install `pihdf` on MacOS.

Install `pihdf` using pip:
==========================

```.bash
$ sudo pip install pihdf
```

__Note:__ If you do not have `pip` installed:
```.bash
$ sudo apt-get install python-pip python-dev build-essential 
$ sudo pip install --upgrade pip 
```

Install `pihdf` from source
---------------------------

For now, instal `pyhdf` from <https://github.com/hnikolov/pihdf>. Download and unzip, or clone `pihdf`. Then:
```.bash
$ cd pihdf
$ sudo python setup.py develop
```

Option `develop` installs `pyhdf` in 'editable' mode. You can use also the option 'install'. However, using the option 'develop' makes it easy to un-install `pihdf` (should you decide to do so).

Un-install ``pihdf``
--------------------

To un-install ``pihdf``:
```.bash
$ cd pihdf
$ sudo python setup.py develop --uninstall
```

Then, remove the command-line script ``module`` from its location:
```.bash
$ which module | xargs sudo rm
```


Dependences on Python packages
==============================
`pihdf` requires the following python packages: __myhdl, myhdl_lib, simplejson, coverage, nose__. 
These packages will be installed during the installation of `pihdf` if not present on your system. 

__Note:__ These packages will __not__ be un-installed if you un-install `pyhdf`.


Co-simulation, waveform and dotty viewers
=========================================
For co-simulations, `pihdf` uses the __Icarus iverilog__ simulator. __GTKWave__ is the waveform viewer used in `pihdf`. For structured designs, `pihdf` generates also the design topology (i.e., HW modules interconnections) as a `.dot` file. To viasualize it, you can use `xdot` program. Install all programs by executing:

```.bash
$ sudo apt-get install iverilog gtkwave xdot
```

Create `myhdl.vpi`
==================
For co-simuations, myhdl uses a `.vpi` interface. To create the `myhdl.vpi` file used with Icarus, download the source of myhdl. Then,

```.bash
$ cd [myhdl-folder]/cosimulation/icarus/
$ make 
```

__Note:__ The file 'myhdl.vpi has to be copied to folder '/.pihdf'


* * *
Now, you are ready to use `pihdf`. Check its [front-end tool][module] (called 'module'), the [details][details] about `pihdf`, and the [turorials][tutorials] that will help you to get started.
{.lead}

