---
title: Command 'add'
layout: page 
pager: true
---

Format
======

```.bash
module [MPATH] add [type] "flags"
```

__\[type\]__ is a known interface type. __flags__ surrownded by quotes provide additional required information.

Command __add__ modifies the module's `.json` file by inserting an entry containing the __\[type\]__ and the additional information. Then, it invokes command [__update__][update].


Usage
=====
For a `hello_world` example, to which we want to add a `64-bit` input `STAvln` called `in_1`, the usage is: 

```.bash
$ module hello_world add STAvln "-n in_1 -d IN -w 64"
```

Check the interfaces section of `pyhdf` for examples of how to add a known interface.

