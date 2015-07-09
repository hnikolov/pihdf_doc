pyhdf_doc
=========

This repo contains the documentation of ``pyhdf``. The sources are in a markdown format and we use `Urubu <http://urubu.jandecaluwe.com/>`__  to convert them to a static website.

Build the website
-----------------

Just use:

    make build

The resulting (html) website is located in directory ``_build``.

Review the website
-------------------

The target website is hosted by ``github pages``. Therefore, the website needs to be built with the prefix ``pyhdf_doc`` (the name of this repo). Consequently, to review the generated website locally, you need to specify the prefix. For that, use `T-Service <https://github.com/jiffyclub/tservice/>`__:

    tserve --prefix pyhdf_doc _build

and point your browser to ``localhost:8000``

``TODO: Currently 'make serve' uses the pyhton built-in server, which does not support prefix. Need to update the makefile to call tserve.``

Install `T-Service <https://github.com/jiffyclub/tservice/>`__
--------------------------------------------------------------

    pip install tservice
