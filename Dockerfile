ARG PYTHON_IMAGE=python:3.8-slim-buster
ARG POETRY_VERSION=1.1.4 

FROM $PYTHON_IMAGE  

ENV PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    # poetry
    # https://python-poetry.org/docs/configuration/#using-environment-variables
    POETRY_VERSION=$POETRY_VERSION \
    # make poetry install to this location
    POETRY_HOME="/opt/poetry" \
    # do not ask any interactive question
    POETRY_NO_INTERACTION=1

# prepend poetry and venv to path
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    # deps for installing poetry
    curl \
    # deps for building python deps
    build-essential

WORKDIR $POETRY_HOME 
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

WORKDIR /src
ONBUILD COPY poetry.lock pyproject.toml ./
ONBUILD RUN poetry export -f requirements.txt --without-hashes -o requirements.txt

