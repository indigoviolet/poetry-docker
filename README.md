
# Table of Contents

1.  [poetry-docker](#orgee153d0)
2.  [Versions](#orgeb8ada1)
3.  [References](#orgedb28c0)
4.  [Usage](#orgf071ea7)
5.  [Local config](#orgd6fa390)


<a id="orgee153d0"></a>

# poetry-docker

Based on <https://github.com/Docker-s-IMAGES/no-pypoetry>

This repo provides a multi-stage build base image that automatically extracts your
Poetry dependencies into `requirements.txt` so that you don&rsquo;t have to do it
yourself.


<a id="orgeb8ada1"></a>

# Versions

    ARG PYTHON_IMAGE=python:3.8-slim-buster
    ARG POETRY_VERSION=1.1.4


<a id="orgedb28c0"></a>

# References

-   <https://github.com/python-poetry/poetry/discussions/1879>
-   <https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker>


<a id="orgf071ea7"></a>

# Usage

See [this example Dockerfile](https://github.com/indigoviolet/poetry-docker/blob/master/Dockerfile-test)

    
    FROM indigoviolet/poetry-docker:latest as requirements
    
    FROM <your base>
    
    ...
    
    # `/src/requirements.txt` will be the result of `poetry export -f requirements.txt --without-hashes`
    COPY --from=requirements /src/requirements.txt ./
    
    RUN pip install -r requirements.txt


<a id="orgd6fa390"></a>

# Local config

We export on save to markdown so that Docker Hub will sync this, it expects `README.md`

