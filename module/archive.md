---
title: Command 'archive'
layout: page 
pager: true
---

Format
======

```.bash
module [PATH] archive
```

Command __archive__ uses `tar -czvf` to create a `.tgz` file containing all the files in the module's directory tree.
The archive is stored in the current directory.

Usage
=====

For a `hello_world` example,
```
$ module hello_world archive
```

will result in:

```
├── hello_world
│   │
│   ...
│
└── hello_world.tgz
```
