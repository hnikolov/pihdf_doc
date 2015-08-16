pyhdf_doc
=========

This repo contains the documentation of ``pyhdf``. The sources are in a markdown format and we use `Urubu <http://urubu.jandecaluwe.com/>`__  to convert them to a static website.

Build the website
-----------------

    make build

The resulting (html) website is located in directory ``_build``.

Review the website
-------------------

    make serve

and point your browser to ``localhost:8000``

The target website is hosted by ``github pages``. Therefore, the website needs to be built with the prefix ``pyhdf_doc`` (the name of this repo). Consequently, to review the generated website locally, you need to specify the prefix. Unfortunately, the pyhton built-in server does not support prefix. Therefore, the ``serve`` target uses `T-Service <https://github.com/jiffyclub/tservice/>`__:

    tserve --prefix pyhdf_doc _build

Install `T-Service <https://github.com/jiffyclub/tservice/>`__
--------------------------------------------------------------

    pip install tservice