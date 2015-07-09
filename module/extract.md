---
title: Command 'extract'
layout: page 
pager: true
---

Format
======

```.bash
module [MPATH] extract
```

Command __extract__ does the opposite of command [__archive__][archive].
That is, it uses `tar -xzvf` to untar a `.tgz` file specified by _MPATH_.

Usage
=====

If a `hello_world` design has been archived:

```
├── hello_world
│   │
│   ...
│
└── hello_world.tgz
```

it can be extracted by:

```.bash
$ module hello_world extract
```

__Note:__ `As a result, if directory hello_world exists (as in the example above), the files in the directory will be overwritten.`
