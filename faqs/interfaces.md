---
title: How to define interfaces in HW design modules?
layout: page
pager: true
---

Below, we show the supported interfaces that can be used in `pyhdf` to build and connect HW modules.
{.lead}

All interfaces (except `Reset` and `Clock`) can be used as input/output global interfaces or local interfaces to
connect HW sub-modules. When used as local interfaces, optionally, a size of a fifo buffer can be specified
by using `"buf_size": "value"` pair. For a local interface, tag `"direction"` is not allowed.
For convenience, we also give an example of how each interface can be used in the `.json` file as a
global interface and the format of command `add`.

Reset
-----
A reset input interface, active level can be specified.

__Example:__ To add an active high reset (called `rst`) to a HW module design, add the following line to section `interfaces` of the corresponding `.json` file:

```.json
{ "name": "rst", "type": "Reset", "active": "1" }
```

Clock
-----
A clock input interface.

__Example:__ To add a clock (called `clk`) to a HW module design, add the following line to section `interfaces` of the corresponding `.json` file:

```.json
{ "name": "clk", "type": "Clock" }
```

HSD
---
The use of `HSD` interface is twofold:

1) A hand-shake (ready-valid) interface with specified data width. A `push` behavior (optional) can also be specified as shown in the example below:

```.json
{ "name": "rx_hs", "type": "HSD", "fields": "64", "direction": "IN", "push": "True" }
```

To use command `add`:
```.bash
$ module PATH add HSD "-n rx_hs -w 64 -d IN -p True"
```

2) `HSD` can be used as a container interface, in which data is represented as a set of fields. Fields are given in file `data_fields.py`, part of `pyhdf`.
A `push` behavior (optional) can also be specified. The default is "False", therefore, if `push` behavior is not needed, this tag can be omitted as in the following example:

```.json
{ "name": "tx_port_flds", "type": "HSD", "direction": "OUT", "fields":"port_fields" }
```
To use command `add`:
```.bash
$ module PATH add HSD "-n tx_port_flds -d OUT -l port_fields"
```

STAvln
------
A streaming interface for packed data (`ready`, `valid`, `sop`, `eop`, `empty`, `data`, `error`).
A packet is defined with start-of-packet (`sop`) and end-of-packet (`eop`) signals.

__Example:__ To add an output STAvln interface called `rx_avln` which has a data width of `64` bits to a HW module design, add the following line to section `interfaces` of the corresponding `.json` file:

```.json
{ "name": "rx_avln", "type": "STAvln", "width": "64", "direction": "OUT" }
```
Alternatively, from a terminal, you can use command `add` to do the same thing:

```.bash
$ module MPATH add STAvln "-n rx_avln -w 64 -d OUT"
```
In this example, `MPATH` is the path to the HW module's root directory.

__Note:__ Tag `push` is not allowed with `STAvln` interfaces.

Bus
---
A container interface consisting of a set of supported interfaces.
The supported interfaces are given in file `data_fields.py`, part of `pyhdf`.

__Example:__ To add a BUS called `axi4_slave` of type `AXI4LS` to a HW module design, add the following line to section `interfaces` of the corresponding `.json` file:

```.json
{ "name": "axi4_slave", "type": "Bus", "interfaces": "AXI4LS" }
```
Alternatively, use command `add` as follows:

```.bash
$ module MPATH add Bus "-n axi4_slave -i AXI4LS"
```
__Note:__ Since a BUS may contain both, input and output interfaces, tag `direction` is not used.

Parameter
---------
Used to specify top-level parameters, i.e., compile-time generics.

__Example:__ To add a parameter `par_1` with a default value `10` to a HW module design, add the following line to section `parameters` of the corresponding `.json` file:

```.json
{ "name": "par_1", "value": "10" }
```

To use command `add`, from a terminal:

```.bash
$ module MPATH add Parameter "-n par_1 -v 10"
```

Again, `MPATH` is the path to the HW module's root directory.

<!-- Use "module help myframework.[interface]" for more information about an interface. -->
* * *
__Note:__ To define a local interface, use the same `json` format; __do not__ use tag `direction`.

__Note:__ Command `add` __cannot__ be used to define local interfaces.