FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
 
<<<<<<< HEAD
ENV DEV="git curl wget build-essential gcc g++ make libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libgl1-mesa-dev libopencv-dev python3 python3-pip"
=======
ENV DEV="git curl wget build-essential gcc g++ make libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev python3 python3-pip"
>>>>>>> 7eebb68acbf1865b009f5fa4175a9cd4c5bd14f5
ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && \
   apt-get -y install $DEV

RUN apt search python-is-python3 \
   && apt-get -y install python-is-python3 \
   && apt-get -y install python3-distutils

ENV PYTHONUNBUFFERED=1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false

ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR /app

COPY poetry.lock pyproject.toml ./

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

<<<<<<< HEAD
RUN poetry install
=======
RUN poetry install
>>>>>>> 7eebb68acbf1865b009f5fa4175a9cd4c5bd14f5
