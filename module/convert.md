---
title: Command 'convert'
layout: page 
pager: true
---

Format
======

```.bash
module [MPATH] convert
```

Command __convert__ converts the __myhdl RTL__ description of a module to synthesizable verilog.

Usage
=====
For a `hello_world` example,

```.bash
$ module hello_world convert
```

will generate verilog for the content of the `hello_world_rtl.py` file. This file must contain myhdl RTL descriptions.
The generated verilog files are stored in directory `out`:

```
└── hello_world
    │
    ...
    ├── out
    │   ├── tb_hello_world_top.v
    │   └── hello_world_top.v
    ├── src
    ...  └── hello_world_rtl.py
    ├──
```

The file `tb_hello_world_top.v` is a wrapper used in co-simulations.
The file `hello_world_top.v` is the RTL verilog, ready for synthesis.
