---
title: Command 'test'
layout: page 
pager: true
---

Format
======

```.bash
module [PATH] test [options]
```

Command test executes the unit tests for the given module. The tests are specified in the
corresponding `utest*.py` file. For a `hello_world` example, the tests are defined in:

```
└── hello_world
    └── test
        └── utest_hello_world.py
```

Usage
=====

```.bash
$ module hello_world test
```

This command runs all available tests in `utest_hello_world.py` file.

To run a single test:

```.bash
$ module hello_world test test_003
```
This command runs only `tst_003` if such a test exists in `utest_hello_world.py` file.


Additional options:
-------------------

```.bash
$ module hello_world test recursive
```

This command runs all available tests in the directory tree of `hello_world`,
including tests of sub-modules.

```.bash
$ module hello_world test with_coverage
```
This command runs all available tests in `utest_hello_world.py` and collect code coverage statistics.

The result is stored in:

```
└── hello_world
    └── out
        └── coverage_html
```

To look at the statistics, open file `index.html` in directory `coverage_html`.

