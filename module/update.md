---
title: Command 'update'
layout: page 
pager: true
---

Format
======

```.bash
$ module [MPATH] update [recursive]
```

Command __update__ re-generates the files, which are created with command [__new__][new]. 
This command is useful when, e.g., a module interfaces or structure changes. 
First, the corresponding `.json` file is modified capturing the changes.

Usage
=====

For a `hello_world` example, the usage is:

```.bash
$ module hello_world update
```

This command updates all the files according to the `.json` file (`TODO:` It does not update `hello_world*.gtkw` files). 
Custom code added in the files below is preserved during the update.

```
└── hello_world
    ├── src
    │   ├── hello_world_beh.py
    │   └── hello_world_rtl.py
    └── test
        └── utest_hello_world.py
```

Option 'recursive'
------------------


```.bash
$ module hello_world update recursive
```

This command updates all available designs in the directory tree of `hello_world`. 
Useful when, for example, a new version of `pihdf` is installed and several module designs need to be updated.
