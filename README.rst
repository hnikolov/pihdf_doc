pyhdf_doc
=========

Build the website
-----------------

This website project is based on `Urubu <http://urubu.jandecaluwe.com/>`__. To create a static website from the ``markdown`` input, use

    make build

The website is created in directory ``_build``.

Review the website
-------------------

The target of this website project is to be hosted by github pages. This required the website to be built with the prefix ``pyhdf_doc`` (the repo name). Consequently, to locally review the generated website before publishing to ``gh-pages``,  use `T-Service <https://github.com/jiffyclub/tservice/>`__:

    tserve --prefix pyhdf_doc _build

and point your browser to ``localhost:8000``

``TODO:`` Currently ``make serve`` uses the pyhton built-in server, which does not support prefix. Need to update the makefile to call tserve.

Install `T-Service <https://github.com/jiffyclub/tservice/>`__
--------------------------------------------------------------

    pip install tservice

Publish to github pages
-----------------------

Before you make the website available at ``gh-pages``, first ``commit`` and ``push`` all modifications. Then,

    make publish

This will push the content of directory ``_build`` to the branch called ``gh-pages``. 
