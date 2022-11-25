#!/bin/bash

# add a user called celery and give root permissions?
cd example_docker

celery -A example_docker flower --address=0.0.0.0 --port=5555