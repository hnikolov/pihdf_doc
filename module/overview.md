---
title: Overview 
layout: page
---

'__module__' is a command-line front-end tool of `pyhdf`
{.lead}

This tool is installed together with __pyhdf__ and it is located in directory `/.pyhdf`.
Therefore, make sure that you have added this directory to the variable _PATH_.


Usage
-----

```.bash
module [MPATH] [command] [options]
```

_MPATH_ specifies a pyhdf's module directory. The directory name is the same as the module name.

The supported commands are:

 Command                  | Description
--------------------------|------------------------------
 [__`new`__][new]         | create a new module project from a `[module_name].json` file
 [__`add`__][add]         | add a new top-level interface or parameter
 [__`remove`__][rem]      | remove a top-level interface or parameter
 [__`update`__][update]   | re-generate the files of a module according to the content of the `.json` file.
 [__`test`__][test]       | execute the unit tests for the specified module. Optional test name can be provided
 [__`convert`__][convert] | convert the __RTL myhdl__ description of a module to __verilog__
 [__`clean`__][clean]     | remove temporary files generated in the module's directory tree
 [__`delete`__][delete]   | delete all files and directories from the module's directory tree; keep the `.json` file
 [__`archive`__][archive] | use _tar -czvf_ to create a .tgz file containing the files from the module's directory tree
 [__`extract`__][extract] | use _tar -xzvf_ to untar a design which has been archived
 [__`help`__][help]       | obtain information about the module's commands and additional useful information

Options
-------
_Options_ are used with the following commands:

 Command                | Description
----------------------- | ------------------------------ 
 [__`add`__][add]       | specify interface type or _Parameter_ and additional flags within quotes
 [__`remove`__][rem]    | specify the name of the interface or parameter to be removed
 [__`update`__][update] | specify option __recursive__ to update all designs in the specified _MPATH_
 [__`test`__][test]     | specify the test name to be executed, or __recursive__, or __with_coverage__
