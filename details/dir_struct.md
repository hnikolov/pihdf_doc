---
title: HW module directory structure
layout: page 
pager: true
---


Input .json file
===============

We use the example from the previous section. That is,
assume, that we would like our HW module `hs_example` to contain two sub-modules, interconnected with a single `HSD` interface, then we can use the following `hs_example.json` file:

```.json
 {
     "design":
     {
         "name": "hs_example",
         "interfaces":
         [
             {"name":"rst","type":"Reset","active":"1" },
             {"name":"clk","type":"Clock" },
             {"name":"rx_hs","type":"HSD","fields":"64","direction":"IN"},
             {"name":"tx_hs","type":"HSD","fields":"64","direction":"OUT"}
         ],
         "parameters":
         [
             {"name":"depth","value":"10"}
         ]
     },
 
     "_comment": "You can put some comments in this way",
 
     "structure":
     {
         "local_interfaces":
         [
             {"name":"hs","type":"HSD","fields":"64","depth":"2"}
         ],
         "design_modules":
         [
             {
                 "name": "module1", "type": "mydesign1",
                 "path": "../mydesign",
                 "connections":
                 [
                     {"direction":"IN","local_name":"rst","connect_to":"rst"},
                     {"direction":"IN","local_name":"clk","connect_to":"clk"},
                     {"direction":"IN","local_name":"rx","connect_to":"rx_hs"},
                     {"direction":"OUT","local_name":"tx","connect_to":"hs"},
                     {"local_name":"PARAM","connect_to":"depth"}
                 ]
             },
             {
                 "name": "module2", "type": "mydesign2",
                 "path": "",
                 "connections":
                 [
                     {"direction":"IN","local_name":"rst","connect_to":"rst"},
                     {"direction":"IN","local_name":"clk","connect_to":"clk"},
                     {"direction":"IN","local_name":"rx","connect_to":"hs"},
                     {"direction":"OUT","local_name":"tx","connect_to":"tx_hs"}
                 ]
             }
         ]
     }
 }
```

In this example, the (global/top-level) `Reset` and `Clock` interfaces are connected to the sub-modules, the `rx_hs` interface is connected to the input of `module1`, and the output of `module2` is connected to the output interface `tx_hs`. The two modules are connected via a hand-shake interface (`hs`) which itself contains a FIFO buffer of depth 2. Note also how comments can be added in the .json file if needed.

Generated directory structure
=============================

The .json file above is sufficient to create a structured design in `pihdf`:

```.bash
$ module hs_example new
```
Since, `path` of `module2` is empty, the command above
will create a new design (sub-)project for `module2` as well. Consequently, the created directory structure of `hs_example` will look as follows:

```
        hs_example
        ├── hs_example.dot
        ├── hs_example.json
        ├── hs_example.py
        ├── __init__.py
        ├── out
        ├── src
        │   ├── compile_list.txt
        │   ├── hs_example_beh.py
        │   ├── hs_example_rtl.py
        │   ├── __init__.py
        │   └── modules
        │       ├── __init__.py
        │       └── mydesign2
        │           ├── __init__.py
        │           ├── mydesign2.json
        │           ├── mydesign2.py
        │           ├── out
        │           ├── src
        │           │   ├── compile_list.txt
        │           │   ├── __init__.py
        │           │   ├── mydesign2_beh.py
        │           │   └── mydesign2_rtl.py
        │           └── test
        │               ├── __init__.py
        │               ├── mydesign2_cosim.gtkw
        │               ├── mydesign2.gtkw
        │               ├── t_mydesign2.py
        │               ├── utest_mydesign2.py
        │               └── vectors
        └── test
            ├── hs_pt_cosim.gtkw
            ├── hs_pt.gtkw
            ├── __init__.py
            ├── inreface_map.py
            ├── t_hs_pt.py
            ├── utest_hs_pt.py
            └── vectors
```

TODO: Note that the directory structure of "mydesign2" resembles the directory structure of "hs_example"... 
