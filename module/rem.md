---
title: Command 'remove'
layout: page 
pager: true
---

Format
======

```.bash
module [PATH] remove [name]
```

__\[name\]__ is an interface or parameter name.

Command __remove__ modifies the module's `.json` file by deleting the entry containing the __\[name\]__. Then, it invokes the [__update__][update] command. 


Usage
=====

For a `hello_world` example, from which we want to remove interface `in_1`, the usage is:

```.bash
$ module hello_world remove in_1
```

