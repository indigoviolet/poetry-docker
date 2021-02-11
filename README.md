
# Table of Contents

1.  [poetry-docker](#org2c41e30)
2.  [Versions](#orgc7af493)
3.  [References](#orgf17e744)
4.  [Usage](#org56d1851)
5.  [Local config](#orgf764add)


<a id="org2c41e30"></a>

# poetry-docker

Based on <https://github.com/Docker-s-IMAGES/no-pypoetry>

This repo provides a multi-stage build base image that automatically extracts your
Poetry dependencies into `requirements.txt` so that you don&rsquo;t have to do it
yourself.


<a id="orgc7af493"></a>

# Versions

    ARG PYTHON_IMAGE=python:3.8-slim-buster
    ARG POETRY_VERSION=1.1.4


<a id="orgf17e744"></a>

# References

-   <https://github.com/python-poetry/poetry/discussions/1879>
-   <https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker>


<a id="org56d1851"></a>

# Usage

    
    FROM indigoviolet/poetry-docker:latest as requirements
    
    FROM <your base>
    
    ...
    
    # `/src/requirements.txt` will be the result of `poetry export -f requirements.txt --without-hashes`
    COPY --from=requirements /src/requirements.txt ./
    
    RUN pip install -r requirements.txt


<a id="orgf764add"></a>

# Local config

