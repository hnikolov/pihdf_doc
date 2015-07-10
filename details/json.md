---
title: json file format of a HW module
layout: page 
pager: true
---


The input/output interfaces and/or the structure of a HW design module are specified in a `.json` file. This is the starting point of a new HW module design. Below, we discuss the format of the .json file.
{.lead}

A HW module .json file has two main sections:

1. "design"
2. "structure"

1) __design__ section of a .json file
-------------------------------------

The __design__ section has the following format:

```.python
"design" = { "name", "interfaces" [, "parameters"] }
```
where

* `name` is the name of a HW module
* `interfaces` is a list of the top-level interfaces
* `parameters` is optional and specifies a list of compile-time constants

The __design__ section is sufficient to create a new HW design module project. A simple, but complete, example of a `.json` file is given below:

```.json
 {
     "design":
     {
         "name": "hs_example",
         "interfaces":
         [
             {"name":"rst","type":"Reset","active":"1"},
             {"name":"clk","type":"Clock"},
             {"name":"rx_hs","type":"HSD","fields":"64","direction":"IN"},
             {"name":"tx_hs","type":"HSD","fields":"64","direction":"OUT"}
         ],
         "parameters":
         [
             {"name":"depth","value":"10"}
         ]
     }
 }
``` 

It specifies a module called `hs_example`, which has an active high reset input, a clock input, one input and one output hand-shake interfaces of type `HSD`. In addition, it has one parameter `depth`, used, e.g., to specify the capacity of an internal FIFO.

2) Section "structure" of a `.json` file
----------------------------------------

This section of a `.json` file gives a structural description of a HW module. It is a convenient way to

* integrate other (i.e., already designed) HW modules into a new compound HW module, or to
* create new design projects for several (nested) HW modules at once. That is, a new sub-project will be created for every module found in this description if it does not exist. The format of the structure section is:

```.python
"structure" : {"local_interfaces", "design_modules"}
```

where

* `local_interfaces` is a list of supported interfaces. These interfaces are used for interconnection of modules
* `design_modules` is a list of HW modules, which are interconnect to form the structure of the top module

The format of a `design_modules` part is list of:

```.python
{"name", "type", "path", "connections"}
```
where

* `name` is the instance name of a module
* `type` is the type of a module
* `path` is the location to the module design project, relative to the new HW module to be created
* `connections` describes the connections of the (local) module using local and/or global interfaces and parameters

If `path` is empty, then a new HW module design project will be created for this module in the source directory structure (see below)

Example
-------

Assume, that we would like our HW module `hs_example` to contain two sub-modules, interconnected with a single `HSD` interface, then we can use the following `hs_example.json` file:

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
