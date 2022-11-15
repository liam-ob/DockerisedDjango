FROM python:3.10

WORKDIR /code

# set python environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# set system environment variables
ENV POETRY_VERSION=1.1.13
ENV DJANGO_SETTINGS_MODULE=example_docker.settings
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=password

# install dependencies
RUN pip install --ignore-installed "poetry==$POETRY_VERSION"
COPY pyproject.toml poetry.lock /code/
RUN POETRY_VIRTUALENVS_CREATE=false poetry install

# copy the project
COPY . /code
EXPOSE 8000