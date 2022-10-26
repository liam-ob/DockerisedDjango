FROM python:3.10

ENV PYTHONUNBUFFERED 1
ENV POETRY_VERSION=1.1.13
ENV DJANGO_SETTINGS_MODULE=example_docker.settings
RUN pip install --ignore-installed "poetry==$POETRY_VERSION"
WORKDIR /code
COPY pyproject.toml poetry.lock /code/
RUN POETRY_VIRTUALENVS_CREATE=false poetry install
COPY . /code
EXPOSE 8000