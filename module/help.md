---
title: Command 'help'
layout: page 
pager: true
---

Format
======

```.bash
module help [topic]
```

Command __help__ gives more information about certain `topic`. A topic can be a module's command or one of the following additional help topics:

Topic               | Description
--------------------|------------------
interfaces          | list of supported interfaces
pihdf               | information about the content of pihdf

Usage
=====
For example,

```.bash
$ module help test
```

This will print the information about command [test][test].
The last topic uses command __help__ to call the integrated python help function and to get information about the classes of pihdf.
In addition, the help information about a particular class of these modules can be obtained by using the `. (dot)` notation.
For example, the following command will print the information available for the class of the base hand-shake interface of `pihdf`:

```.bash
$ module help pihdf.HSD
```

Similarly, we can get the available information of any class of the python installation, e.g.,

```.bash
$ module help math.cos
```

will print the following information

```
Help on built-in function cos in math:

math.cos = cos(...)
    cos(x)

    Return the cosine of x (measured in radians).
```

