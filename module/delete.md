---
title: Command 'delete'
layout: page 
pager: true
---

Format
======

```.bash
module [PATH] delete
```

Command __delete__ does what its name suggests: deletes all files and directories from the module's directory tree. It keeps only the `.json` file.

Usage
=====

For a `hello_world` example,

```.bash
$ module hello_world delete
```

will result in:

```
└── hello_world
    └── hello_world.json
```

Then, command [__new__][new] can be run again (or after modifications of `hello_world.json` file).
