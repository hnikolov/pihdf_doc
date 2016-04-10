---
title: Install
layout: page 
pager: true
---

Below, we present the steps to instal `pihdf` with all the dependencies, considering __Linux Ubuntu__ distribution.
{.lead}

MacOS is supported as well. However, we do not provide details about how to install `pihdf` on MacOS.

There are 2 ways to install `pihdf` on Ubuntu:

Install `pihdf` using pip
-------------------------

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

If you plan to contribute to `pihdf`, it is better to install it from source: 
<https://github.com/hnikolov/pihdf>. You can do this by:
```.bash
$ git clone https://github.com/hnikolov/pihdf
$ cd pihdf
$ sudo python setup.py develop
```

Option `develop` installs `pyhdf` in _editable_ mode. 
This is very convenient because your changes are immediately reflected into the installed `pihdf` package.
This means that you do not need to re-install `pihdf` in order your changes to take effect.


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
For co-simuations, myhdl uses a `.vpi` interface. To create the `myhdl.vpi` file used with __Icarus__, you need the source of `myhdl`:

```.bash
$ git clone https://github.com/jandecaluwe/myhdl
$ make -C myhdl/cosimulation/icarus
$ sudo mkdir /.pihdf
$ sudo cp myhdl/cosimulation/icarus/myhdl.vpi /.pihdf
```

__Note:__ `pihdf` expects file `myhdl.vpi` to be in folder `/.pihdf`


* * *
* * *
Now, you are ready to use `pihdf`. Check its [front-end tool][module] (called `module`), the [details][details] about `pihdf`, and the [turorials][tutorials] that will help you to get started.
{.lead}
* * *
* * *

Un-install
==========

Un-installing `pihdf` (should you decide to do so) is easy. Depending on how you installed it, you can:

Un-install `pihdf` using pip
----------------------------

```.bash
$ sudo pip uninstall pihdf
```

Un-install `pihdf` if installed from source
-------------------------------------------

```.bash
$ cd pihdf
$ sudo python setup.py develop --uninstall
```

Remove `module`
---------------

To remove the command-line tool `module` from its location:
```.bash
$ which module | xargs sudo rm
```

