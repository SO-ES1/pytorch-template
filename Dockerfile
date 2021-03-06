FROM nvidia/cuda:11.3.0-cudnn8-devel-ubuntu20.04
 
ENV DEV="git curl wget build-essential gcc g++ make libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libgl1-mesa-dev libopencv-dev python3 python3-pip"
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && \
   apt-get -y install $DEV

RUN apt search python-is-python3 \
   && apt-get -y install python-is-python3 \
   && apt-get -y install python3-distutils

ENV PYTHONUNBUFFERED=1 \
    POETRY_HOME="/opt/poetry"

ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR /app

COPY poetry.lock pyproject.toml ./

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# RUN poetry install
