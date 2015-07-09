---
title: Command 'new'
layout: page 
pager: true
---

Format
======

```.bash
module [MPATH] new
```

Command __new__ creates a new module project from a `.json` file located in _MPATH_. The json file must have the same name as the directory in which it is located. For example, for a new module `hello_world`, the starting point is:

```
└── hello_world
    └── hello_world.json
```

In case _MPATH_ points to a directory which does not exist or a properly named `.json` file is not found in the directory pointed to by _MPATH_, then command __new__ creates a default .json file as well as the corresponding directory if needed. The default .json file contains only a `Reset` and `Clock` interfaces. This is convenient way to create a new HW module project without the need to prepare a .json file in advance.

Usage
=====

```.bash
$ module hello_world new
```
 
The command will generate the following files and directories:

```
└── hello_world
    ├── hello_world.json
    ├── hello_world.py
    ├── __init__.py
    ├── out
    ├── src
    │   ├── compile_list.txt
    │   ├── hello_world_beh.py
    │   ├── hello_world_rtl.py
    │   └── __init__.py
    └── test
        ├── hello_world_cosim.gtkw
        ├── hello_world.gtkw
        ├── __init__.py
        ├── t_hello_world.py
        ├── utest_hello_world.py
        └── vectors
```

After creating the project, you can use commands [__add__][add] and [__remove__][rem] to build/update the top-level interfaces of the HW module. The `.json` file is modified accordingly after every use of these commands.
