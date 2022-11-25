FROM python:3.10

WORKDIR /code

# set python environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# set system environment variables
ENV POETRY_VERSION=1.1.13
ENV DJANGO_SETTINGS_MODULE=example_docker.settings

# install dependencies
RUN pip install --ignore-installed "poetry==$POETRY_VERSION"
COPY pyproject.toml poetry.lock /code/
RUN POETRY_VIRTUALENVS_CREATE=false poetry install

# expose port so that you can access webserver on local machine
EXPOSE 8000


# mount project directory?
#FROM alpine:3.14
#RUN --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -it
