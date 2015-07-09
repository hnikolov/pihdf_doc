---
title: Command 'clean'
layout: page 
pager: true
---

Format
======

```.bash
module [MPATH] clean
```

Command __clean__ removes the files, which have been generated as a result of running simulation or conversion to verilog.
In particular, this command deletes the following files:
 
Extension   |  Description
-------------------|-------------------------
__.pyc__    |  python bytecode files
__.vcd__    |  wave-form files from simulations
__.v__      |  verilog files generated for co-simulation and synthesis
__.tvr__    |  test-vectors and results from simulations

Command clean deletes also directory `coverage_html`.
