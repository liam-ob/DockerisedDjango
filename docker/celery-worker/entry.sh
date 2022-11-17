# add a user called celery and give root permissions?
useradd -ms /bin/bash celery
usermod -a -G celery celery
usermod -a -G celery root

celery -A example_docker worker