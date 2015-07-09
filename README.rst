pyhdf_doc
=========

Build a website
---------------

To create a static website from the ``markdown`` input, use

    make build

The site is created in directory ``_build``.

Review the website
-------------------

To locally review the generated site before publishing to ``gh-pages``, use

    tserve --prefix pyhdf_doc _build

and point your browser to ``localhost:8000``

``tserve`` is availabe at https://github.com/jiffyclub/tservice

Install ``tserve``
------------------

    pip install tservice

Publish to github pages
-----------------------

Before you make the website available at ``gh-pages``, first ``commit`` and ``push`` all modifications. Then,

    make publish
